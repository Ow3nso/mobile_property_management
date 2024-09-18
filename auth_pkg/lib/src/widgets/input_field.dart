import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final double height;

  CustomInputField({
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
        border: Border.all( // Add border property
          color: Color(0xFF315EE7), // Set the border color
          width: 1.0, // Set the border width
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none, // Remove the default border
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Padding inside the input field
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(Icons.visibility_off),
            onPressed: () {
              // Implement visibility toggle functionality if needed
            },
          )
              : null,
        ),
      ),
    );
  }
}
