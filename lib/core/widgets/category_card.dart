import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;
  const CategoryCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //decoration: BoxDecoration(boxShadow: Shadows.universal),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: Shadows.universal
              // boxShadow: [BoxShadow(offset: Offset(0, 1), color: Colors.grey)],
              ),
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ))
            ],
          ),
        ));
  }
}
