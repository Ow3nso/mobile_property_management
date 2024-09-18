import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/input_field.dart'; // Import the custom text input field

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding around the content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rentaxo',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF22215B),
                ),
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 74.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF22215B),
                ),
              ),
              Text(
                'YOUR EMAIL',
                style: TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10),
              CustomInputField(
                hintText: 'example@gmail.com',
                isPassword: false,
                controller: emailController,
              ),
              SizedBox(height: 20),
              Text(
                'YOUR PASSWORD',
                style: TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10),
              CustomInputField(
                hintText: 'Password',
                isPassword: true,
                controller: passwordController,
              ),
              SizedBox(height: 30), // Add some spacing between the input field and the button
              CustomButton(
                label: 'Login',
                onPressed: () {
                  // Define your action here
                  print('Button Pressed!');
                },
                color: Color(0xFF315EE7),
                textColor: Colors.white,
                width: double.infinity,
                height: 50,
              ),
              SizedBox(height: 30),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/signUp'); // Change to your sign-up route
                  },
                  child: Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
