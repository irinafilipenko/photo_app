import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Log out',
        style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xFF1B1B1F)),
      ),
      content: Text('Are you sure you want to logout?',
          style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF44474F))),
      actions: [
        TextButton(
          child: Text('Cancel',
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF535F70))),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Log out',
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0061A6))),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ],
    );
  }
}
