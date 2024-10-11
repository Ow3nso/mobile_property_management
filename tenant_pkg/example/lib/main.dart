import 'package:flutter/material.dart';
import 'package:tenant_pkg/src/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Manager Dashboard',
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
      },
    );
  }
}
