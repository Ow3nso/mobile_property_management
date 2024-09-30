import 'package:flutter/material.dart';
import 'package:dashboard_pkg/src/pages/dashboard.dart';

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
        '/': (context) => DashboardPage(),
      },
    );
  }
}
