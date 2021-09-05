import 'package:baguette_app/features/all_products/domain/category.dart';

class CategoryModel extends Categories {
  String id;
  String image;
  String name;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  }) : super(id: id, name: name, image: image);

  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
