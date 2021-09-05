import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  String id;
  String image;
  String name;
  Categories({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}
