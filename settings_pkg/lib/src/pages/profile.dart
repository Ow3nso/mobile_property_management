import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:auth_pkg/src/pages/login.dart';

import '../widgets/settings_list_items.dart';
import '../widgets/log_out_button.dart';
// import '../widgets/navigation/navigation_bar.dart';

// Page UI
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120.0), 
                      child: SizedBox(
                        width: 120.0, 
                        height: 120.0, 
                        child: Image.network(
                          'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/50dab922-5d48-4c6b-8725-7fd0755d9334/3a3f2d35-8167-4708-9ef0-bdaa980989f9.png',
                          fit: BoxFit.cover, 
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0), 
                    Text(
                      '${user?.displayName ?? "Welcome User"}',
                      style: TextStyle(
                        fontSize: 24.0, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black, 
                      ),
                    ),
                    SizedBox(height: 8.0), 
                    Text(
                      '${user?.email ?? " "}', 
                      style: TextStyle(
                        fontSize: 16.0, 
                        fontWeight: FontWeight.normal, 
                        color: Color(0xFF7D7F88),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Divider
                    Divider(
                      color: Colors.grey,
                      thickness: 1,     
                      indent: 5,         
                      endIndent: 5,      
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
                        // Navigate to FAQ page
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
                        // Navigate to switch accounts page
                      },
                    ),
                    SizedBox(height: 20),
                    LogOutButton(
                      label: 'Logout',
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.signOut();
                          Future.delayed(const Duration(seconds: 3), () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (_) => LoginPage(),
                              ),
                            );
                          });
                        } on Exception catch (e) {
                          Fluttertoast.showToast(
                            msg: e.toString(),
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 14.0,
                          );
                        }
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
