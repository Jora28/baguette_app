import 'package:baguette_app/core/widgets/loading.dart';
import 'package:baguette_app/core/widgets/show_toast.dart';
import 'package:baguette_app/features/sign_up/data/data_sourse.dart';
import 'package:baguette_app/features/sign_up/presentation/bloc/signup_bloc.dart';
import 'package:baguette_app/features/sign_up/presentation/widgets/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final RegisterServise registerServise = RegisterServise();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignupBloc(
          registerServise: registerServise,
          context: context,
        ),
        child: BlocConsumer<SignupBloc, SignupState>(
          listener: (context, state) {
            if(state is SignUpError){
               showToast(context);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                if (state is SignupInitial)
                  SignUpWidget()
                else if (state is SignUpRequest)
                  LoadingWidget()
              ],
            );
          },
        ),
      ),
    );
  }
}
