//import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'package:baguette_app/core/router.gr.dart';
import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/utils/string_utils.dart';
import 'package:baguette_app/core/widgets/button.dart';
import 'package:baguette_app/core/widgets/input.dart';
import 'package:auto_route/auto_route.dart';

import 'package:baguette_app/features/sign_in/presentation/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final _formStateSingIn = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordEditCotroller = TextEditingController();

  String email = "tom@gmail.com";
  String password = '12345678';

  dynamic _onSignIn() async {
    if (!_formStateSingIn.currentState!.validate()) {
      return;
    }
    _formStateSingIn.currentState?.save();
    final SigninBloc signinBloc = BlocProvider.of<SigninBloc>(context);
    signinBloc.add(SignIn(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              final FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                currentFocus.focusedChild?.unfocus();
              }
            },
            child: Scaffold(
              body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: _body(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
        child: Form(
      key: _formStateSingIn,
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 375),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 150.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 70, left: 25, right: 25),
              child: Image.asset('assets/images/logo_baguette.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustumInput(
                controller: _emailController,
                hintText: 'User Email',
                prefix: Icons.person_outline,
                onSaved: (v) => email = v!,
                validator: (v) => v!.isEmpty
                    ? "Email is required!"
                    : StringUtils.isEmail(v)
                        ? null
                        : "Invalid email",
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustumInput(
                controller: _passwordEditCotroller,
                hintText: "Password",
                prefix: Icons.lock_outline,
                onSaved: (v) => password = v!,
                validator: (v) => v!.isEmpty ? "Password is required" : null,
                obscureText: false,
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(20),
            //   width: double.infinity,
            //   child: Text(
            //     "Forgot password?",
            //     textAlign: TextAlign.end,
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "LOGIN",
                    style: TextStyle(color: AppColors.gold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 55,
                    child: CustumButton(
                      text: "Sign In",
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _onSignIn();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: const Text("I haven`t got an account")),
                Container(
                  height: 44,
                  margin: const EdgeInsets.only(
                    top: 20,
                    left: 5,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      context.router.push(const SignUpPageRoute());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: AppColors.gold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
