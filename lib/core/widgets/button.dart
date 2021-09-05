import 'package:baguette_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  CustumButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: AppColors.blue,
        ),
        child: Icon(Icons.arrow_forward),
        onPressed: onTap);
  }
}
