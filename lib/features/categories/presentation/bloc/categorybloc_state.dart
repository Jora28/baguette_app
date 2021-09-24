part of 'categorybloc_bloc.dart';

abstract class CategoryblocState extends Equatable {
  const CategoryblocState();

  @override
  List<Object> get props => [];
}

class CategoryblocInitial extends CategoryblocState {}

class CategoryLoading extends CategoryblocState {}

class CategoryError extends CategoryblocState {}

class CategoryLoaded extends CategoryblocState {
  final List<CategoryModel> listCategoryModel;
  final CustomerModel customerModel;
  const CategoryLoaded({
    required this.listCategoryModel,
    required this.customerModel,
  });

  @override
  List<Object> get props => [listCategoryModel, customerModel];
}
