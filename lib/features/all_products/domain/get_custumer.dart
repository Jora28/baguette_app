import 'package:equatable/equatable.dart';

class GetCustomer extends Equatable {
   String id;
   String name;
   String email;

  GetCustomer({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
}
