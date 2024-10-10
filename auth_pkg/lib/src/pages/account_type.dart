import 'package:flutter/material.dart';
import 'package:dashboard_pkg/dashboard_pkg.dart';

import '../pages/signup.dart';

class AccountSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context) => SignUpPage()),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Rentaxo',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select account type',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Don't worry, this can be changed later.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            AccountTypeButton(
              icon: Icons.work_outline,
              text: 'I am a property manager',
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder:(context) => Dashbo()),
                // );
              },
            ),
            SizedBox(height: 20),
            AccountTypeButton(
              icon: Icons.person_outline,
              text: 'I am looking to rent',
              onTap: () {
                // Handle hire selection
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountTypeButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const AccountTypeButton({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
