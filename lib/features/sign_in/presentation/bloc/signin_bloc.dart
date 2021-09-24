import 'dart:async';
import 'package:baguette_app/core/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:baguette_app/core/utils/string_utils.dart';
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
  final SignInServise authServise;

  final BuildContext context;

  SigninBloc({
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
        context.router.push(const HomePageRoute());
      } on FirebaseException catch (e) {
        final String message = e.code.split('-').join(" ");

        yield SignInError(message: StringUtils.titleCaseSingle(message));
      }
    }
  }
}
