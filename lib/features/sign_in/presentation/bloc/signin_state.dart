part of 'signin_bloc.dart';

abstract class SigninState extends Equatable {
  const SigninState();
  @override
  List<Object?> get props => [];
}

class SigninInitial extends SigninState {}

class SignInRequest extends SigninState {}

class SignInEnded extends SigninState {}

class Error extends SigninState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
