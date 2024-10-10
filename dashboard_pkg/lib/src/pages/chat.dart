// import 
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
              'Messages',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Notification Bell Icon on the right
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Handle notification tap
              },
            ),
          ],
        ),
        automaticallyImplyLeading: false, // Removes default back arrow
      ),
    );
  }
}