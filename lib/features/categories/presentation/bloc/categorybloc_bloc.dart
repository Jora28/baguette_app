import 'dart:async';

import 'package:baguette_app/features/base_models/custumer_model.dart';
import 'package:baguette_app/features/categories/data/category_model.dart';
import 'package:baguette_app/features/categories/data/data_sourse.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categorybloc_event.dart';
part 'categorybloc_state.dart';

class CategoryblocBloc extends Bloc<CategoryblocEvent, CategoryblocState> {
  CategoryblocBloc() : super(CategoryblocInitial());

  @override
  Stream<CategoryblocState> mapEventToState(
    CategoryblocEvent event,
  ) async* {
    if (event is GetCategory) {
      try {
        yield CategoryLoading();
        final List<CategoryModel> listCategory =
            await event.getCategorySevise.getCategories();
        final CustomerModel customerModel =
            await event.getCustomerServise.getUserData();
        yield CategoryLoaded(
          listCategoryModel: listCategory,
          customerModel: customerModel,
        );
      } catch (e) {
        yield CategoryError();
      }
    }
  }
}
