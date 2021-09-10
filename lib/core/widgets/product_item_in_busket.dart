import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProductItemBasket extends StatelessWidget {
  final String name;
  final String image;
  final int price;
  final Icon icon;
  final int count;
  final Function() onSave;
  final Function() onP;
  final Function() onM;

  const ProductItemBasket({
    required this.image,
    required this.onM,
    required this.onP,
    this.count = 0,
    required this.name,
    required this.price,
    required this.icon,
    required this.onSave,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: Shadows.universal
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 10),

                    //width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      name,
                      maxLines: 1,
                      // softWrap: false,
                      // overflow: TextOverflow.ellipsis,
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "֏" + " ${price * count}",
                      maxLines: 1,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    )),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle,
                          color: AppColors.red,
                        ),
                        onPressed: onM,
                      ),
                      Text("$count"),
                      IconButton(
                          icon: const Icon(Icons.add_circle,
                              color: AppColors.red),
                          onPressed: onP),
                      SizedBox(
                        child: IconButton(
                          onPressed: onSave,
                          icon: Container(
                            child: icon,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}