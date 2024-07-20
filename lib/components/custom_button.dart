import 'package:flutter/material.dart';
import 'package:photo_app/components/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.isLoading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return InkWell(
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: customColors!.surfaceTint,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? SizedBox(
                width: 20, // Adjust the width as needed
                height: 20, // Adjust the height as needed
                child: CircularProgressIndicator(
                  strokeWidth: 2.0, // Adjust the stroke width as needed
                  valueColor:
                      AlwaysStoppedAnimation<Color>(customColors.onPrimary),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: customColors.onPrimary,
                  fontFamily: "Roboto",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
