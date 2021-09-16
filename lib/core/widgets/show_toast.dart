import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/utils/styles.dart';
import 'package:baguette_app/core/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dynamic showToast({
  required BuildContext context,
  required String text,
  required ToastGravity toastGravity,
}) {
  final FToast toast = FToast();
  toast.init(context);
  toast.showToast(
    gravity: toastGravity,
    toastDuration: Times.toastDuration,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.red,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: const TextStyle(color: AppColors.white),
        ),
      ),
    ),
  );
}
