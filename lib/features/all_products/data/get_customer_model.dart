
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