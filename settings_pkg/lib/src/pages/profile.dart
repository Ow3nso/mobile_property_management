import 'package:flutter/material.dart';

import 'package:auth_pkg/src/pages/login.dart';

import '../widgets/settings_list_items.dart';
import '../widgets/log_out_button.dart';
import '../widgets/navigation/navigation_bar.dart';

// Page UI
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Column for the profile details
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120.0), // Adjusted for better visual effect
                      child: SizedBox(
                        width: 120.0, // Set width for the image container
                        height: 120.0, // Set height for the image container
                        child: Image.network(
                          'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/50dab922-5d48-4c6b-8725-7fd0755d9334/3a3f2d35-8167-4708-9ef0-bdaa980989f9.png',
                          fit: BoxFit.cover, // Adjust how the image should fit
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0), // Space between the image and the text
                    Text(
                      'Jeffrey Owen', // Your text here
                      style: TextStyle(
                        fontSize: 24.0, // Adjust text size as needed
                        fontWeight: FontWeight.bold, // Make text bold
                        color: Colors.black, // Adjust text color as needed
                      ),
                    ),
                    SizedBox(height: 8.0), // Space between the image and the text
                    Text(
                      'jeffowen04@gmail.com', // Your text here
                      style: TextStyle(
                        fontSize: 16.0, // Adjust text size as needed
                        fontWeight: FontWeight.normal, // Make text bold
                        color: Color(0xFF7D7F88), // Adjust text color as needed
                      ),
                    ),
                    SizedBox(height: 20),
                    // Divider
                    Divider(
                      color: Colors.grey, // Line color
                      thickness: 1,       // Line thickness
                      indent: 5,         // Space from the start
                      endIndent: 5,      // Space from the end
                    ),
                  ],
                ),
              ),
              // ListView for the settings list items
              Expanded(
                child: ListView(
                  children: [
                    SettingsListItem(
                      icon: Icons.person,
                      title: 'Personal details',
                      onTap: () {
                        // Navigate to personal details page
                      },
                    ),
                    SizedBox(height: 10),
                    SettingsListItem(
                      icon: Icons.settings,
                      title: 'Settings',
                      onTap: () {
                        // Navigate to settings page
                      },
                    ),
                    SizedBox(height: 10),
                    SettingsListItem(
                      icon: Icons.credit_card,
                      title: 'Payment details',
                      onTap: () {
                        // Navigate to payment details page
                      },
                    ),
                    SizedBox(height: 10),
                    SettingsListItem(
                      icon: Icons.comment,
                      title: 'FAQ',
                      onTap: () {
                        // Navigate to payment details page
                      },
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.grey, // Line color
                      thickness: 1,       // Line thickness
                      indent: 5,         // Space from the start
                      endIndent: 5,      // Space from the end
                    ),
                    SizedBox(height: 10),
                    SettingsListItem(
                      icon: Icons.switch_account,
                      title: 'Switch accounts',
                      onTap: () {
                        // Navigate to payment details page
                      },
                    ),
                    SizedBox(height: 20),
                    LogOutButton(
                      label: 'Logout',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      color: Color(0xFF6246EA),
                      textColor: Colors.white,
                      width: double.infinity,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
