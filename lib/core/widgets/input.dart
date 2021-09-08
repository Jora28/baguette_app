import 'package:baguette_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustumInput extends StatelessWidget {
  final String hintText;
  final IconData prefix;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final bool obscureText;
  const CustumInput({
    required this.hintText,
    required this.prefix,
    required this.onSaved,
    required this.validator,
    required this.controller,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(fontSize: 20, color: Colors.black),
        decoration: InputDecoration(
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue, width: 1)),
          isDense: true,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: AppColors.blue),
          hintText: hintText,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue, width: 1)),
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.blue.withOpacity(0.3), width: 1)),
          prefixIcon: Icon(
            prefix,
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
