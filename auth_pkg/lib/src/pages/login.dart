import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';
import 'package:settings_pkg/src/pages/main_page.dart';

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
              SizedBox(height: 100),
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
              SizedBox(height: 20),
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
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Move to the end
                children: [
                  Text(
                    'FORGOT PASSWORD?',
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              CustomButton(
                label: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                color: Color(0xFF315EE7),
                textColor: Colors.white,
                width: double.infinity,
                height: 50,
              ),
              SizedBox(height: 30), // Add some spacing before OR LOGIN WITH text
              Center(
                child: Column(
                  children: [
                    Text(
                      'OR LOGIN WITH',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 10), // Space between text and icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.account_circle),
                          iconSize: 40.0,
                          onPressed: () {
                            // Add Google login functionality here
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.facebook),
                          iconSize: 40.0,
                          onPressed: () {
                            // Add Facebook login functionality here
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(), // Push the following text to the bottom
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
