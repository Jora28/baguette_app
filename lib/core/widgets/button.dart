import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String? text;
  final Function() onTap;

  CustumButton({this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.white,
        child: Text(text!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20)),
        onPressed: onTap);
  }
}
