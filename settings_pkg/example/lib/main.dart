import 'package:flutter/material.dart';

import 'package:settings_pkg/src/pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Settings Package Example',
      initialRoute: '/',
      routes: {
        '/': (context) => ProfilePage(),
      },
    );
  }
}
