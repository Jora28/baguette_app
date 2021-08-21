//import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/utils/string_utils.dart';
import 'package:baguette_app/core/widgets/input.dart';
import 'package:baguette_app/core/widgets/toast.dart';
import 'package:baguette_app/features/sign_in/presentation/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SignInWidget extends StatefulWidget {
  static final routeName = 'SingInPage';

  SignInWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final _formStateSingIn = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordEditCotroller = TextEditingController();

  String email = "";
  String password = '';

  // Users users;
  // bool isLoading = false;

  void _onSignIn() async {
    if (!_formStateSingIn.currentState!.validate()) {
      return;
    }
    _formStateSingIn.currentState?.save();
    final weaterBloc = BlocProvider.of<SigninBloc>(context);
    weaterBloc.add(SignIn(email: email, password: password));
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
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                currentFocus.focusedChild?.unfocus();
              }
            },
            child: Scaffold(
              body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
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
        child: Container(
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
                  margin: EdgeInsets.only(top: 70, left: 25, right: 25),
                  child: Image.asset('assets/images/logo_baguette.png'),
                  decoration: BoxDecoration()),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustumInput(
                  controller: _emailController,
                  hintText: 'User Email',
                  prefix: Icons.person_outline,
                  onSaved: (v) => this.email = v!,
                  validator: (v) => v!.isEmpty
                      ? "Email is required!"
                      : StringUtils.isEmail(v)
                          ? null
                          : "Invalid email",
                  focusNode: FocusNode(),
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustumInput(
                  controller: _passwordEditCotroller,
                  hintText: "Password",
                  prefix: Icons.lock_outline,
                  onSaved: (v) => this.password = v!,
                  validator: (v) => v!.isEmpty ? "Password is required" : null,
                  obscureText: false,
                  focusNode: FocusNode(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Text(
                  "Forgot password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: AppColors.gold, fontSize: 24),
                      ),
                    ),
                    Container(
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), primary: AppColors.blue),
                        child: Icon(Icons.arrow_forward),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _onSignIn();
                        },
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text("I haven`t got an account")),
                  Container(
                    height: 44,
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 5,
                    ),
                    child: TextButton(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: AppColors.gold),
                      ),
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushReplacementNamed(SignUpPage.routeName);
                        print("yani navigate");
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
