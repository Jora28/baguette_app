import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:baguette_app/core/router.gr.dart';
import 'package:baguette_app/features/sign_up/data/custumer_model.dart';
import 'package:baguette_app/features/sign_up/data/data_sourse.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final RegisterServise registerServise;
  final BuildContext context;

  SignupBloc({
    required this.registerServise,
    required this.context,
  }) : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is SignUp) {
      try {
        yield SignUpRequest();
        await registerServise.registerWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        await registerServise.upDateUser(model: event.customerModel);
        yield SignUpEnded();
        context.router.push(const HomePageRoute());
      } on FirebaseException catch (e) {
        final message = e.code.split('-').join(" ");
        yield SignUpError(message: message.toUpperCase());
      }
    }
  }
}
