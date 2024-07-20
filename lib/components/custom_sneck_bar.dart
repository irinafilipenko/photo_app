import 'package:flutter/material.dart';
import 'package:photo_app/components/theme.dart';

CustomSnackBar({required String message, required context}) async {
  final customColors = Theme.of(context).extension<CustomColors>();
  return SnackBar(
    content: SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            message,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: customColors!.onInverseSurface),
          )),
          GestureDetector(
            onTap: () {
              // Hide the SnackBar
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: Icon(Icons.close, color: customColors.onInverseSurface),
          ),
        ],
      ),
    ),
    backgroundColor: customColors.onInverseSurface,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
    duration: const Duration(hours: 1), // Make the SnackBar persistent
  );
}
