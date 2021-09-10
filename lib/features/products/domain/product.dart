import 'package:equatable/equatable.dart';

class Product extends Equatable {
  String id;
  final String name;
  final String image;
  final int price;
  final String category;

  int count;

  Product(
      {required this.category,
      required this.name,
      required this.image,
      required this.price,
      required this.id,
      required this.count});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image, price, category];
}
