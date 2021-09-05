import 'dart:async';
import 'package:baguette_app/core/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/widgets/show_toast.dart';
import 'package:baguette_app/core/widgets/toast.dart';

import 'package:baguette_app/features/sign_in/data/data_sourse.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthServise authServise;
  final String? email;
  final String? password;
  final BuildContext context;

  SigninBloc({
     this.email,
     this.password,
    required this.authServise,
    required this.context,
  }) : super(SigninInitial());

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is SignIn) {
      try {
        yield SignInRequest();
        await authServise.singInWithEmailAndPassword(
            email: event.email, password: event.password);
        yield SignInEnded();
        context.router.push(AllProductPageRoute());
      } on FirebaseException {
        yield Error(message: 'Your email/passwor is wrong');
      }
    }
  }
}
