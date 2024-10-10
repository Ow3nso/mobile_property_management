import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settings_pkg/src/pages/main_page.dart';

import '../widgets/button.dart';
import '../widgets/input_field.dart';
import '../widgets/or_divider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Added form key

  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      // Sign out the currently signed-in user
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();

      // Start the Google Sign-In process
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credentials
        final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

        // Navigate to the main page after successful sign-in using MaterialPageRoute
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );

        return userCredential;
      } else {
        Fluttertoast.showToast(
          msg: "Google sign-in failed",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
    return null; // Return null if sign-in fails
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color
        child: SingleChildScrollView( // Make the content scrollable
          padding: const EdgeInsets.all(16.0), // Add padding around the content
          child: Form( // Wrap the input fields with Form widget
            key: _formKey, // Assign form key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70),
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
                SizedBox(height: 20),
                CustomButton(
                  label: 'Login',
                  onPressed: () async {
                    String message = '';
                    if (_formKey.currentState!.validate()) { // Use form key for validation
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text, // Get email from controller
                          password: passwordController.text, // Get password from controller
                        );
                        Future.delayed(const Duration(seconds: 3), () {
                          print('success');
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (_) => MainPage(),
                            ),
                          );
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                          message = 'Invalid login credentials.';
                        } else {
                          message = e.code;
                        }
                        Fluttertoast.showToast(
                          msg: message,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          backgroundColor: Colors.black54,
                          textColor: Colors.white,
                          fontSize: 14.0,
                        );
                      }
                    }
                  },
                  color: Color(0xFF315EE7),
                  textColor: Colors.white,
                  width: double.infinity,
                  height: 50,
                ),
                SizedBox(height: 20), // Add some spacing before OR LOGIN WITH text
                Center(
                  child: Column(
                    children: [
                      OrDivider(),
                      SizedBox(height: 10), // Space between text and icons
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            label: 'Continue with google',
                            onPressed: () async {
                              await signInWithGoogle(context);
                            },
                            color: Colors.white,
                            textColor: Colors.black,
                            width: double.infinity,
                            height: 50,
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            label: 'Continue with facebook',
                            onPressed: () async {
                              await signInWithGoogle(context);
                            },
                            color: Colors.white,
                            textColor: Colors.black,
                            width: double.infinity,
                            height: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100), // Added space before the sign-up text
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/signUp'); 
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
      ),
    );
  }
}
