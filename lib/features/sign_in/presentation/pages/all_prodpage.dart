import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


class AllProductPage extends StatefulWidget {
  const AllProductPage({Key? key}) : super(key: key);

  @override
  _AllProductPageState createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Text('All Products Page'),
          onTap: () {
            context.router.pop();
          },
        ),
      ),
    );
  }
}
