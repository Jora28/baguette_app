// import 'package:baguette_app/widgets/colors.dart';
// import 'package:flutter/material.dart';

// class ProductItemBasket extends StatelessWidget {
//   final String name;
//   final String image;
//   final int price;
//   final Icon icon;
//   final int count;
//   final Function onSave;
//   final Function onP;
//   final Function onM;

//   ProductItemBasket({
//     this.image,
//     this.onM,
//     this.onP,
//     this.count = 0,
//     this.name,
//     this.price,
//     this.icon,
//     this.onSave,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//       decoration: BoxDecoration(
//         color: backgroundColorCard,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             child: Container(),
//             padding: EdgeInsets.all(2),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(30),
//                     topLeft: Radius.circular(30)),
//                 image: DecorationImage(
//                     image: image == null
//                         ? AssetImage('assets/images/baguette.png')
//                         : NetworkImage(image),
//                     fit: BoxFit.cover)),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                     margin: EdgeInsets.only(left: 10),

//                     //width: MediaQuery.of(context).size.width * 0.6,
//                     child: Text(
//                       name,
//                       maxLines: 1,
//                       // softWrap: false,
//                       // overflow: TextOverflow.ellipsis,
//                     )),
//                 Container(
//                     margin: EdgeInsets.only(left: 10),
//                     child: Text(
//                       "֏" + " ${price * count}",
//                       maxLines: 1,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontStyle: FontStyle.italic),
//                     )),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           Icons.remove_circle,
//                           color: backgroundColorRed,
//                         ),
//                         onPressed: onM,
//                       ),
//                       Text("$count"),
//                       IconButton(
//                           icon:
//                               Icon(Icons.add_circle, color: backgroundColorRed),
//                           onPressed: onP),
//                       Container(
//                         child: IconButton(
//                           onPressed: onSave,
//                           icon: Container(
//                             child: icon,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Container(
// //         margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
// //         child: Container(
// //           height: 100,
// //           decoration: BoxDecoration(
// //             color: backgroundColorCard,
// //             borderRadius: BorderRadius.circular(30),
// //           ),
// //           child: Row(
// //             children: <Widget>[
// //               Flexible(
// //                 flex: 2,
// //                 child: Container(
// //                   width: 100,
// //                   height: 100,
// //                   padding: EdgeInsets.all(2),
// //                   decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.only(
// //                           bottomLeft: Radius.circular(30),
// //                           topLeft: Radius.circular(30)),
// //                       image: DecorationImage(
// //                           image: image == null
// //                               ? AssetImage('assets/images/baguette.png')
// //                               : NetworkImage(image),
// //                           fit: BoxFit.cover)),
// //                 ),
// //               ),
// //               Flexible(
// //                 flex: 3,
// //                 child: Container(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Expanded(
// //                         child: Container(
// //                             child: Text(
// //                           name,
// //                           maxLines: 1,
// //                           textAlign: TextAlign.center,
// //                           style: TextStyle(
// //                               color: Colors.black,
// //                               fontSize: 15,
// //                               fontStyle: FontStyle.italic),
// //                         )),
// //                       ),
// //                       Expanded(
// //                         child: Container(
// //                             margin: EdgeInsets.only(top: 10),
// //                             child: Text(
// //                               "${price * count}",
// //                               maxLines: 1,
// //                               style: TextStyle(
// //                                   color: Colors.black,
// //                                   fontSize: 20,
// //                                   fontStyle: FontStyle.italic),
// //                             )),
// //                       ),
// //                       Expanded(
// //                         child: Container(
// //                           child: Row(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               IconButton(
// //                                 icon: Icon(
// //                                   Icons.remove_circle,
// //                                   color: backgroundColorRed,
// //                                 ),
// //                                 onPressed: onM,
// //                               ),
// //                               Text("$count"),
// //                               IconButton(
// //                                   icon: Icon(
// //                                     Icons.add_circle,
// //                                     color:backgroundColorRed
// //                                   ),
// //                                   onPressed: onP
// //                                   ),
// //                             ],
// //                           ),
// //                         ),
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Flexible(
// //                 flex: 1,
// //                 child: Container(
// //                   child: IconButton(
// //                     onPressed: onSave,
// //                     icon: Container(
// //                       child: icon,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ));
