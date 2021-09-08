// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:baguette_app/widgets/colors.dart';
// import 'package:flutter/material.dart';

// class ProductItem extends StatefulWidget {
//   final String name;
//   final String image;
//   final int price;
//   final Icon icon;
//   int count;
//   final Function onSave;
//   final Function onP;
//   final Function onM;

//   ProductItem({
//     required this.image,
//     required this.onM,
//     required this.onP,
//     required this.count,
//     required this.name,
//     required this.price,
//     required this.icon,
//     required this.onSave,
//   });

//   @override
//   _ProductItemState createState() => _ProductItemState();
// }

// class _ProductItemState extends State<ProductItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//         child: Container(
//           height: 100,
//           decoration: BoxDecoration(
//             color: backgroundColorCard,
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: Row(
//             children: <Widget>[
//               Flexible(
//                 flex: 2,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   padding: EdgeInsets.all(2),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(30),
//                           topLeft: Radius.circular(30)),
//                       image: DecorationImage(
//                           image: widget.image == null
//                               ? AssetImage('assets/images/baguette.png')
//                               : NetworkImage(widget.image),
//                           fit: BoxFit.cover)),
//                 ),
//               ),
//               Flexible(
//                 flex: 3,
//                 child: Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                           margin: EdgeInsets.only(left: 10),
//                           child: Text(
                            
//                             widget.name,
//                             maxLines: 1,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 15,
//                                 fontStyle: FontStyle.italic),
//                           )),
//                       Container(
//                           margin: EdgeInsets.only(left: 10),
//                           child: Text(
//                            "֏"+" "+ widget.price.toString(),
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15,
//                                 fontStyle: FontStyle.italic),
//                           )),
//                       Flexible(
//                         child: Container(
//                           child: Row(
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.remove_circle,
//                                     size: 30, color: backgroundColorRed),
//                                 onPressed: widget.onM,
//                               ),
//                               Text("${widget.count}"),
//                               IconButton(
//                                   icon: Icon(
//                                     Icons.add_circle,
//                                     color: backgroundColorRed,
//                                     size: 30,
//                                   ),
//                                   onPressed: widget.onP),
//                               Spacer(),
//                               Container(
//                                 child: ElevatedButton.icon(
//                                   style: ElevatedButton.styleFrom(
//                                       primary: backgroundColorBlue,
//                                       shape: RoundedRectangleBorder(
//                                        // side: BorderSide(color: borderColor),
//                                         borderRadius:
//                                             BorderRadius.circular(39),
//                                       )),
//                                   label: Text(
//                                     "Add",
//                                   ),
//                                   onPressed: widget.onSave,
//                                   icon: Container(
//                                     child: widget.icon,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
