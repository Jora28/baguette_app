import 'package:baguette_app/core/widgets/loading.dart';
import 'package:baguette_app/features/categories/data/data_sourse.dart';
import 'package:baguette_app/features/categories/presentation/bloc/categorybloc_bloc.dart';
import 'package:baguette_app/features/categories/presentation/widgets/all_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({Key? key}) : super(key: key);

  @override
  _AllProductPageState createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  GetCategorySevise getCategorySevise = GetCategorySevise();
  GetCustomerServise getCustomerServise = GetCustomerServise();

  late CategoryblocBloc getCategoryBloc;
  @override
  void initState() {
    getCategoryBloc = BlocProvider.of<CategoryblocBloc>(context);
    getCategoryBloc.add(GetCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CategoryblocBloc, CategoryblocState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Stack(
              children: [
                if (state is CategoryLoading)
                  const LoadingWidget()
                else if (state is CategoryLoaded)
                  AllProductsPageWidget(
                      listCategory: state.listCategoryModel,
                      getCustomerModel: state.customerModel)
              ],
            );
          }),
    );
  }
}
