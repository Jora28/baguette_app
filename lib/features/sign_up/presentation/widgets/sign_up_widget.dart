import 'package:baguette_app/core/router.gr.dart';
import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/utils/string_utils.dart';
import 'package:baguette_app/core/widgets/button.dart';
import 'package:baguette_app/core/widgets/input.dart';
import 'package:baguette_app/features/sign_up/data/custumer_model.dart';
import 'package:baguette_app/features/sign_up/presentation/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:auto_route/auto_route.dart';

class SignUpWidget extends StatefulWidget {
  static final routeName = 'SingUpPage';

  SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final GlobalKey<FormState> _formStateSingIn = GlobalKey<FormState>();
  String? password;
  String? email;
  String? userName;
  CustomerModel customerModel = CustomerModel(email: '', id: '', name: '');
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordEditCotroller = TextEditingController();
  TextEditingController _nikNameeditController = TextEditingController();

  bool isLoading = false;

  void _onSignUp() async {
    if (!_formStateSingIn.currentState!.validate()) {
      return;
    }
    _formStateSingIn.currentState!.save();

    customerModel.name = userName!;
    customerModel.email = email!;

    final signUpBloc = BlocProvider.of<SignupBloc>(context);
    signUpBloc.add(SignUp(
        customerModel: customerModel,
        email: _emailController.text,
        password: _passwordEditCotroller.text));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild!.unfocus();
            }
          },
          child: Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: _body(),
            ),
          ),
        ),
        if (isLoading) Center(child: CircularProgressIndicator())
      ],
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
                  hintText: 'Nick Name',
                  prefix: Icons.person_outline,
                  onSaved: (v) => userName = v,
                  validator: (v) => v!.isEmpty ? "Enter a Nick Name" : null,
                  controller: _nikNameeditController,
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustumInput(
                  hintText: 'User Email',
                  prefix: Icons.person_outline,
                  onSaved: (v) => email = v,
                  validator: (v) => v!.isEmpty
                      ? "Email is required!"
                      : StringUtils.isEmail(v)
                          ? null
                          : "Invalid email",
                  controller: _emailController,
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustumInput(
                  hintText: "Password",
                  prefix: Icons.lock_outline,
                  onSaved: (v) => password = v,
                  validator: (v) => v!.isEmpty ? "Password is required" : null,
                  obscureText: false,
                  controller: _passwordEditCotroller,
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
                        'SIGN UP',
                        style: TextStyle(color: AppColors.gold, fontSize: 24),
                      ),
                    ),
                    Container(
                      height: 55,
                      child: CustumButton(
                        text: "Sign Up",
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _onSignUp();
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
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text("I have an account")),
                  Container(
                    height: 44,
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 5,
                    ),
                    child: TextButton(
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: AppColors.gold),
                      ),
                      onPressed: () {
                        context.router.push(SignInPageRoute());
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
