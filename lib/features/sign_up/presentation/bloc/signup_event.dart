part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUp extends SignupEvent {
  final String email;
  final String password;
  final CustomerModel customerModel;

  const SignUp({
    required this.email,
    required this.password,
    required this.customerModel,
  });
  @override
  List<Object> get props => [customerModel, email, password];
}
