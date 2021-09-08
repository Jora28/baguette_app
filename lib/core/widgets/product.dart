import 'package:baguette_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String name;
  final String image;
  final int price;
  final Icon icon;
  final int count;
  final Function() onSave;
  final Function() onP;
  final Function() onM;

  const ProductItem({
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
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover)),
                ),
              ),
              Flexible(
                flex: 4,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.name,
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          )),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            "֏" + " " + widget.price.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          )),
                      Flexible(
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle,
                                        size: 30, color: AppColors.red),
                                    onPressed: widget.onM,
                                  ),
                                  Text("${widget.count}"),
                                  IconButton(
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: AppColors.red,
                                        size: 30,
                                      ),
                                      onPressed: widget.onP),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: AppColors.blue,
                                      shape: RoundedRectangleBorder(
                                        // side: BorderSide(color: borderColor),
                                        borderRadius: BorderRadius.circular(39),
                                      )),
                                  label: const Text(
                                    "Add",
                                  ),
                                  onPressed: widget.onSave,
                                  icon: Container(
                                    child: widget.icon,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
