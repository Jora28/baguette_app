part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignUpRequest extends SignupState {}

class SignUpEnded extends SignupState {}

class SignUpError extends SignupState {
  final String message;
  const SignUpError({required this.message});
  @override
  List<Object> get props => [message];
}
