import 'package:flutter/material.dart';
import 'package:photo_app/components/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.isLoading,
    required this.onPressed,
  });

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
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(customColors.onPrimary),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: customColors.onPrimary,
                ),
              ),
      ),
    );
  }
}
