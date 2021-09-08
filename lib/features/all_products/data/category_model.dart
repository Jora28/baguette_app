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

  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}
