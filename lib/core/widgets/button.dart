import 'package:baguette_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CustumButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          primary: AppColors.blue,
        ),
        onPressed: onTap,
        child: const Icon(Icons.arrow_forward));
  }
}
