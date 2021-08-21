import 'package:baguette_app/core/router.gr.dart';
import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/widgets/toast.dart';
import 'package:baguette_app/features/sign_in/data/data_sourse.dart';
import 'package:baguette_app/features/sign_in/presentation/bloc/signin_bloc.dart';
import 'package:baguette_app/features/sign_in/presentation/pages/all_prodpage.dart';
import 'package:baguette_app/features/sign_in/presentation/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthServise authServise = AuthServise();
  late SigninBloc signinBloc;

  @override
  void initState() {
    signinBloc = SigninBloc(authServise: authServise, email: '', password: '');
    super.initState();
  }

  @override
  void dispose() {
    signinBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => signinBloc,
        child: BlocBuilder(
          bloc: signinBloc,
          builder: (BuildContext context, state) {
            if (state is SigninInitial) {
              return SignInWidget();
            } else if (state is SignInRequest) {
              return buildLoading();
            } else if (state is SignInEnded) {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AllProductPage();
                    },
                  ),
                );
              });
            } else if (state is Error) {
              // showToast(text: state.message);
              return SignInWidget();
            }
            return SignInWidget();
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
