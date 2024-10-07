import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final bool isLoading;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 50.0,
    this.isLoading = false,
    this.fontSize = 20.0,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Updated to 'backgroundColor'
          side: BorderSide(
            color: Color(0xFF315EE7), // Border color
            width: 2.0, // Border width
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(textColor),
        )
            : Text(
          label,
          style: TextStyle(
              color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
