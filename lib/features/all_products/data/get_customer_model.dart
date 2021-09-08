import 'package:baguette_app/features/sign_up/domain/customer.dart';

class GetCustomerModel extends Customer {
  GetCustomerModel({
    required String id,
    required String name,
    required String email,
  }) : super(
          id: id,
          name: name,
          email: email,
        );

  factory GetCustomerModel.fromJson(json) {
    return GetCustomerModel(
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
