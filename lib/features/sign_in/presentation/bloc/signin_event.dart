part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent extends Equatable {
  const SigninEvent();
}

class SignIn extends SigninEvent {
  final String email;
  final String password;

  SignIn({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
