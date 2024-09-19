import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';
import 'package:settings_pkg/src/pages/main_page.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Set container height to screen height
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between main content and footer
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 57.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF22215B),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Full Name',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomInputField(
                      hintText: 'John Doe',
                      isPassword: false,
                      controller: nameController,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email',
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
                    SizedBox(height: 10),
                    Text(
                      'PASSWORD',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomInputField(
                      hintText: 'password',
                      isPassword: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Confirm PASSWORD',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomInputField(
                      hintText: 'confirm password',
                      isPassword: true,
                      controller: confirmPasswordController,
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      label: 'Submit',
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
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'OR SIGNUP WITH',
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
                  ],
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/logIn');
                    },
                    child: Text(
                      'Already have an account? Log In',
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
      ),
    );
  }
}
