import 'package:equatable/equatable.dart';

class Customer extends Equatable {
   String id;
   String name;
   String email;

  Customer({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
}
