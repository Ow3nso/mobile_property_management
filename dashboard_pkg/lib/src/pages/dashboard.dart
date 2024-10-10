import 'package:flutter/material.dart';
import 'package:settings_pkg/src/pages/main_page.dart';

import '../widgets/property_card.dart';
import '../pages/property_list.dart';
import '../pages/property_detail.dart';
import '../pages/wallet.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Profile Icon (Avatar) on the left
            GestureDetector(
              onTap: () {
                // Handle profile tap
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://plus.unsplash.com/premium_vector-1720601330464-72e2e9c3bc90?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA5fHxwcm9maWxlJTIwcGhvdG98ZW58MHx8MHx8fDA%3D', // Profile image URL
                ),
              ),
            ),
            // Centered Dashboard text
            const Text(
              'Dashboard',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Notification Bell Icon on the right
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notification tap
              },
            ),
          ],
        ),
        automaticallyImplyLeading: false, // Removes default back arrow
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  _buildDashboardCard(
                    icon: Icons.account_balance_wallet,
                    label: 'Wallet',
                    color: Colors.green,
                    onTap: () {
                      // Navigate to WalletPage when the Wallet card is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage(initialIndex: 1)),
                      );
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.chat,
                    label: 'Chat',
                    color: Colors.orange,
                    onTap: () {
                      // Navigate to WalletPage when the Wallet card is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage(initialIndex: 3)),
                      );
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.analytics,
                    label: 'Analytics',
                    color: Colors.blue,
                    // onTap: () {
                    //   // Navigate to WalletPage when the Wallet card is tapped
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => MainPage(initialIndex: 1)),
                    //   );
                    // },
                  ),
                  _buildDashboardCard(
                    icon: Icons.explore,
                    label: 'Explore',
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            // Add the property section below the dashboard cards
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Properties',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PropertyListPage()),
                          );
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      // navigate to detail view
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PropertyDetailPage()),
                      );
                    },
                    child: PropertyCard(
                      imageUrl:
                          'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Property image
                      title: 'Entire private villa in Surabaya City',
                      location: 'Narayanter, Near bimal\'s Villa',
                      price: 'KSH 400 / month',
                      rating: 4.9,
                      reviews: 104,
                      rooms: 2,
                      area: '488 m²',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build dashboard cards
  Widget _buildDashboardCard(
      {required IconData icon,
      required String label,
      required Color color,
      VoidCallback? onTap}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 48, color: color),
            SizedBox(height: 16),
            Text(
              label,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
