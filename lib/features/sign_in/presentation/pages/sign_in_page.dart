import 'package:baguette_app/core/widgets/loading.dart';
import 'package:baguette_app/core/widgets/show_toast.dart';
import 'package:baguette_app/core/widgets/toast.dart';
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
  bool absorbing = false;
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
            if (state is SignInError) {
              showToast(
                  context: context,
                  text: state.message,
                  toastGravity: ToastGravity.BOTTOM);
              absorbing = false;
            } else if (state is SignInRequest) {
              absorbing = true;
            }
          },
          builder: (BuildContext context, state) {
            return AbsorbPointer(
              absorbing: absorbing,
              child: Stack(
                children: [
                  const SignInWidget(),
                  if (state is SigninInitial)
                    const SignInWidget()
                  else if (state is SignInRequest)
                    const LoadingWidget()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
