import 'package:baguette_app/core/widgets/loading.dart';
import 'package:baguette_app/features/all_products/data/data_sourse.dart';
import 'package:baguette_app/features/all_products/presentation/bloc/categorybloc_bloc.dart';
import 'package:baguette_app/features/all_products/presentation/widgets/all_product_widget.dart';
import 'package:baguette_app/features/sign_in/presentation/widgets/initial_buld.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CategoryblocBloc(
          getCategorySevise: getCategorySevise,
          getCustomerServise: getCustomerServise,
        ),
        child: BlocConsumer<CategoryblocBloc, CategoryblocState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Stack(
                children: [
                  if (state is CategoryblocInitial)
                    Body()
                  else if (state is CategoryLoading)
                    LoadingWidget()
                  else if (state is CategoryLoaded)
                    AllProductsPageWidget(
                        listCategory: state.listCategoryModel,
                        getCustomerModel: state.customerModel)
                ],
              );
            }),
      ),
    );
  }
}
