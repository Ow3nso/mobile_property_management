import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:settings_pkg/src/pages/main_page.dart';

import '../widgets/button.dart';
import '../widgets/input_field.dart';
import '../widgets/or_divider.dart';
import '../pages/account_type.dart';



class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
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
                        onPressed: () async {
                          String message = '';
                          if (_formKey.currentState!.validate()) {
                            try {
                              UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );

                              // Update the user's profile with the full name
                              await userCredential.user?.updateProfile(displayName: nameController.text.trim());

                              Fluttertoast.showToast(
                                msg: "Account created successfully!",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.SNACKBAR,
                                backgroundColor: Colors.black54,
                                textColor: Colors.white,
                                fontSize: 14.0,
                              );

                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MainPage()),
                                );
                              });
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                message = 'The password provided is too weak.';
                              } else if (e.code == 'email-already-in-use') {
                                message = 'An account already exists with that email.';
                              }
                              Fluttertoast.showToast(
                                msg: message,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.SNACKBAR,
                                backgroundColor: Colors.black54,
                                textColor: Colors.white,
                                fontSize: 14.0,
                              );
                            } catch (e) {
                              Fluttertoast.showToast(
                                msg: "Failed: $e",
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
                      SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            OrDivider(),
                            const SizedBox(height: 10),
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
                    ],
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context) => AccountSelectionPage()),
                      );
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
