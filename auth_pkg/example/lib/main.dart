import 'package:flutter/material.dart';
import 'package:auth_pkg/src/pages/login.dart'; // Adjust the import according to your package structure
import 'package:auth_pkg/src/pages/signup.dart';
import 'package:auth_pkg/src/pages/genesis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Package Example',
      initialRoute: '/',
      routes: {
        '/': (context) => GenesisPage(),
        '/logIn': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
      },
    );
  }
}
