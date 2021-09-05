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
      id: json["id"],
      email: json['email'],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();

    data['email'] = this.email;
    data['name'] = this.name;
    data['id'] = this.id;

    return data;
  }
}