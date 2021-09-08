import 'package:baguette_app/features/sign_up/domain/customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required String id,
    required String name,
    required String email,
  }) : super(
          id: id,
          name: name,
          email: email,
        );

  factory CustomerModel.fromJson(json) {
    return CustomerModel(
      id: json["id"] as String,
      email: json['email'] as String,
      name: json["name"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['email'] = email;
    data['name'] = name;
    data['id'] = id;

    return data;
  }
}
