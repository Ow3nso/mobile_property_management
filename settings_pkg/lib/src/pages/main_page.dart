import 'package:flutter/material.dart';
import 'package:dashboard_pkg/src/pages/dashboard.dart';
import '../pages/profile.dart'; // Import ProfilePage
import '../widgets/navigation/navigation_bar.dart'; // Import the custom nav bar

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // List of pages to navigate to
  final List<Widget> _pages = [
    DashboardPage(),
    // ExplorePage(),
    // ChatPage(),
    // SavedPage(),
    ProfilePage(), // Include ProfilePage here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
