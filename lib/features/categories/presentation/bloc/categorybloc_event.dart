part of 'categorybloc_bloc.dart';

abstract class CategoryblocEvent extends Equatable {
  const CategoryblocEvent();

  @override
  List<Object> get props => [];
}

class GetCategory extends CategoryblocEvent {
  final GetCategorySevise getCategorySevise;
  final GetCustomerServise getCustomerServise;

  const GetCategory({
    required this.getCategorySevise,
    required this.getCustomerServise,
  });
}
