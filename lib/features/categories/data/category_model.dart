import 'package:baguette_app/features/categories/domain/category.dart';

class CategoryModel extends Categories {
  const CategoryModel({
    required String id,
    required String name,
    required String image,
  }) : super(
          id: id,
          name: name,
          image: image,
        );

  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}
