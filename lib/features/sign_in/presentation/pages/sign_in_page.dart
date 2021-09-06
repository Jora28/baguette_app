import 'package:baguette_app/core/widgets/loading.dart';
import 'package:baguette_app/core/widgets/show_toast.dart';
import 'package:baguette_app/features/sign_in/data/data_sourse.dart';
import 'package:baguette_app/features/sign_in/presentation/bloc/signin_bloc.dart';
import 'package:baguette_app/features/sign_in/presentation/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInServise authServise = SignInServise();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SigninBloc(
          authServise: authServise,
          context: context,
        ),
        child: BlocConsumer<SigninBloc, SigninState>(
          listener: (context, state) {
            if (state is Error) {
              showToast(context);
            }
          },
          builder: (BuildContext context, state) {
            return Stack(
              children: [
                SignInWidget(),
                if (state is SigninInitial)
                  SignInWidget()
                else if (state is SignInRequest)
                  LoadingWidget()
              ],
            );
          },
        ),
      ),
    );
  }
}
