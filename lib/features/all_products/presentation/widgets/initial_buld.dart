import 'package:baguette_app/features/all_products/presentation/bloc/categorybloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}


class _BodyState extends State<Body> {


  @override
  void initState() {
    final getCategoryBloc = BlocProvider.of<CategoryblocBloc>(context);
    getCategoryBloc.add(GetCategory());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}