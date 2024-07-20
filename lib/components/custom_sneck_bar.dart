import 'package:flutter/material.dart';

SnackBar CustomSnackBar({required String message, required context}) {
  return SnackBar(
    content: Container(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            message,
            style: TextStyle(fontFamily: "Roboto", fontSize: 14),
          )),
          GestureDetector(
            onTap: () {
              // Hide the SnackBar
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
    ),
    backgroundColor: Color(0xFF2F3033),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: 20, left: 16, right: 16),
    duration: Duration(hours: 1), // Make the SnackBar persistent
  );
}
