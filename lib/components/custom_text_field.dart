import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final String hintText;
  final bool isValid;
  final bool isLoading;
  final Function(String) onChanged;
  final Function(String) onValidate;
  final bool isObscure;

  CustomTextField({
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.hintText,
    required this.isValid,
    required this.isLoading,
    required this.onChanged,
    required this.onValidate,
    this.isObscure = false,
  });

  OutlineInputBorder _getBorder(bool isValid, bool isFocused, bool isLoading) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: isLoading
            ? Color(0xFF79747E).withOpacity(0.12)
            : isValid
                ? (isFocused ? Color(0xFF0061A6) : Color(0xFF73777F))
                : Color(0xFFBA1A1A),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          focusNode: focusNode,
          onFocusChange: (hasFocus) {
            if (!hasFocus && !isLoading) {
              onValidate(controller.text);
            }
          },
          child: TextField(
            style: TextStyle(
                fontFamily: "Roboto", fontSize: 16, color: Color(0xFF1A1C1E)),
            cursorColor: isValid || focusNode.hasFocus
                ? Color(0xFF0061A6)
                : Color(0xFFBA1A1A),
            controller: controller,
            // enabled: !isLoading,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                fontFamily: "Roboto",
                color: isLoading
                    ? Color(0xFF79747E).withOpacity(0.12)
                    : isValid
                        ? (focusNode.hasFocus
                            ? Color(0xFF0061A6)
                            : Color(0xFF73777F))
                        : Color(0xFFBA1A1A),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16,
                  color: isLoading
                      ? Color(0xFF79747E).withOpacity(0.12)
                      : Color(0xFF73777F)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: _getBorder(isValid, false, isLoading),
              focusedBorder: _getBorder(isValid, focusNode.hasFocus, isLoading),
              errorBorder: _getBorder(false, false, isLoading),
              focusedErrorBorder: _getBorder(false, true, isLoading),
              // fillColor: Colors.grey.shade200,
              // filled: isLoading,
            ),
            obscureText: isObscure,
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ),
        SizedBox(height: 5),
        if (!isValid)
          Text(
            '$labelText is incorrect',
            style: TextStyle(
                fontFamily: "Roboto", fontSize: 12, color: Color(0xFFBA1A1A)),
          ),
      ],
    );
  }
}
