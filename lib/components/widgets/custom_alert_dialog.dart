import 'package:flutter/material.dart';
import 'package:photo_app/components/theme.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return AlertDialog(
      backgroundColor: customColors!.background,
      title: Text(
        'Log out',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: customColors.onSurface),
      ),
      content: Text('Are you sure you want to logout?',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: customColors.onSurfaceVariant)),
      actions: [
        TextButton(
          child: Text('Cancel',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: customColors.secondary)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Log out',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: customColors.primary)),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ],
    );
  }
}
