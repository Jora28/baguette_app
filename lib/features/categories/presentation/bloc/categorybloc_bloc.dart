import 'dart:async';

import 'package:baguette_app/features/categories/data/category_model.dart';
import 'package:baguette_app/features/categories/data/data_sourse.dart';
import 'package:baguette_app/features/categories/data/get_customer_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categorybloc_event.dart';
part 'categorybloc_state.dart';

class CategoryblocBloc extends Bloc<CategoryblocEvent, CategoryblocState> {
  final GetCategorySevise getCategorySevise;
  final GetCustomerServise getCustomerServise;
  CategoryblocBloc({
    required this.getCategorySevise,
    required this.getCustomerServise,
  }) : super(CategoryblocInitial());

  @override
  Stream<CategoryblocState> mapEventToState(
    CategoryblocEvent event,
  ) async* {
    if (event is GetCategory) {
      try {
        yield CategoryLoading();
        final List<CategoryModel> listCategory =
            await getCategorySevise.getCategories();
        final GetCustomerModel customerModel =
            await getCustomerServise.getUserData();
        yield CategoryLoaded(
          listCategoryModel: listCategory,
          customerModel: customerModel,
        );
      } catch (e) {
        yield CategoryError();
        print("get category erroe");
      }
    }
  }
}
