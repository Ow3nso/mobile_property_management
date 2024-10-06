import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:auth_pkg/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:auth_pkg/src/pages/login.dart'; // Adjust the import according to your package structure
import 'package:auth_pkg/src/pages/signup.dart';
import 'package:auth_pkg/src/pages/genesis.dart';
import 'package:settings_pkg/src/pages/main_page.dart';

void main() async {
  // Ensure that the Flutter widgets binding is initialized before any async code
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Package Example',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), // Listen to authentication state changes
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;

            // Navigate to MainPage if user is signed in, otherwise navigate to LoginPage
            return user == null ? LoginPage() : MainPage();
          } else {
            // Show a loading spinner while checking authentication state
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      routes: {
        '/signUp': (context) => SignUpPage(),
        '/logIn': (context) => LoginPage(),
        '/genesis': (context) => GenesisPage(),
      },
    );
  }
}
