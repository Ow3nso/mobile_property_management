// import packages
import 'package:flutter/material.dart';

// Widget
class SettingsListItem extends StatelessWidget{
  // properties
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsListItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // Background color for the icon
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}