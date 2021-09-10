import 'package:baguette_app/core/widgets/loading.dart';
import 'package:baguette_app/features/products/data/get_product.dart';
import 'package:baguette_app/features/products/presentation/bloc/product_bloc.dart';
import 'package:baguette_app/features/products/presentation/widgets/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  final String id;

  const ProductPage({Key? key, required this.id}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductBloc productBloc;
  @override
  void initState() {
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(
        GetProducts(id: widget.id, getProductsServise: GetProductsServise()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (BuildContext context, state) {
          return Stack(
            children: [
              if (state is ProductsLoading)
                const LoadingWidget()
              else if (state is ProductsLoaded)
                ProductsWidget(
                  productList: state.listProducts,
                )
            ],
          );
        },
      ),
    );
  }
}
