import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            thickness: 1, // Adjust the thickness of the line
            color: Colors.grey, // Line color
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "OR",
            style: TextStyle(
              fontSize: 16, // Adjust the text size
              fontWeight: FontWeight.bold, // Optional: Make text bold
              color: Colors.grey, // Text color
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1, // Adjust the thickness of the line
            color: Colors.grey, // Line color
          ),
        ),
      ],
    );
  }
}
