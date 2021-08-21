import 'dart:async';

import 'package:baguette_app/core/widgets/toast.dart';
import 'package:baguette_app/features/sign_in/data/data_sourse.dart';
import 'package:baguette_app/features/sign_in/domain/customer.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthServise authServise;
  final String email;
  final String password;
  SigninBloc({
    required this.email,
    required this.password,
    required this.authServise,
  }) : super(SigninInitial());

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is SignIn) {
      yield SignInRequest();
      final customer = await authServise.singInWithEmailAndPassword(
          email: event.email, password: event.password);
      if (customer) {
        yield SignInEnded();
      } else {
        yield Error(message: 'Your email/passwor is wrong');
      }
    }
  }
}
