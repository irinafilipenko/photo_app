import 'package:flutter/material.dart';
import 'package:photo_app/components/theme.dart';

SnackBar CustomSnackBar({required String message, required context}) {
  final customColors = Theme.of(context).extension<CustomColors>();
  return SnackBar(
    content: Container(
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
            child: Icon(Icons.close, color: customColors!.onInverseSurface),
          ),
        ],
      ),
    ),
    backgroundColor: customColors.onInverseSurface,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: 20, left: 16, right: 16),
    duration: Duration(hours: 1), // Make the SnackBar persistent
  );
}
