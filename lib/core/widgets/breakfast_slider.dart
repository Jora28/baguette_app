import 'package:baguette_app/core/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BasicDemo extends StatefulWidget {
  // List<String> imageList;
  BasicDemo();
  @override
  _BasicDemoState createState() => _BasicDemoState();
}

class _BasicDemoState extends State<BasicDemo> {
  final List<String> imageList = [
    'https://2000z7yqh3m1mlk432mteo6r-wpengine.netdna-ssl.com/wp-content/uploads/2020/05/Mothers-Day-Brunch-834x1024.jpg',
    'https://i.pinimg.com/564x/93/ea/8f/93ea8f8d9533cfbfe3a97da8463564cd.jpg',
    'https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fit,w_764,h_1146/k%2Farchive%2F6667cb16163dc7f6b96358df40c2ad600dd9c803'
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1.0,
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.height * 0.25,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: imageList
                .map((item) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                item,
                              ),
                              fit: BoxFit.cover)),
                      // child: Image.network(
                      //   item,
                      //   fit: BoxFit.cover,
                      // )
                    ))
                .toList(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.map((url) {
                int index = imageList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? AppColors.blue
                          : Colors.white),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
