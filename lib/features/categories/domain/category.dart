import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final String id;
  final String image;
  final String name;
  const Categories({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}
