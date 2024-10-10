import 'package:flutter/material.dart';
import 'package:dashboard_pkg/src/pages/dashboard.dart';
import 'package:dashboard_pkg/src/pages/wallet.dart';
import 'package:dashboard_pkg/src/pages/create_property.dart';
import 'package:dashboard_pkg/src/pages/chat.dart';
import '../pages/profile.dart'; // Import ProfilePage
import '../widgets/navigation/navigation_bar.dart'; // Import the custom nav bar

class MainPage extends StatefulWidget {
  final int initialIndex; // Add this to take an initial page index

  // Constructor with default index 0 (DashboardPage)
  MainPage({this.initialIndex = 0});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex; // Use late to indicate it will be initialized later

  @override
  void initState() {
    super.initState();
    // Initialize _selectedIndex with initialIndex from the widget
    _selectedIndex = widget.initialIndex;
  }

  // List of pages to navigate to
  final List<Widget> _pages = [
    DashboardPage(),
    WalletPage(),
    ListNewPropertyPage(),
    ChatPage(),
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
