// imports
import 'package:flutter/material.dart';

import '../widgets/button.dart';

class GenesisPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    // scaffold
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset('assets/images/genesis_house_img.png'),
            // text
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFF22215B),
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'Rentaxo',
              style: TextStyle(
                color: Color(0xFF22215B),
                fontWeight: FontWeight.bold,
                fontSize: 56,
              ),
            ),
            Text(
              'Find a tenant or list your property in just simple steps',
              style: TextStyle(
                color: Color(0xFF7B7F9E),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height:30),
            Text(
              'You are one step away',
              style: TextStyle(
                color: Color(0xFF7B7F9E),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height:30),
            // button
            CustomButton(
              label: 'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, '/logIn');
              },
              color: Color(0xFF315EE7),
              textColor: Colors.white,
              width: double.infinity,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}