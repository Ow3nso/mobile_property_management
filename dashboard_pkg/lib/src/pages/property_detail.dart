import 'package:flutter/material.dart';
import '../widgets/button.dart';

class PropertyDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image with icons
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with your image
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: Row(
                    children: [
                      Icon(Icons.favorite_border, color: Colors.white, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.share, color: Colors.white, size: 30),
                    ],
                  ),
                ),
              ],
            ),
            // Watch intro video button
            Center(
              child: SizedBox(
                width: 350, // Set the desired width here
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10), // Adjust vertical padding only
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.blue),
                    ),
                    backgroundColor: Colors.white,
                    // onPrimary: Colors.blue,
                  ),
                  child: Text("Watch Intro Video"),
                ),
              ),
            ),
            // Property details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Entire Bromo Mountain view Cabin in Surabaya',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Text('4.1 (66 reviews)'),
                      Spacer(),
                      Icon(Icons.bed),
                      Text('2 room'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text('Kapan, Jorpati'),
                      Spacer(),
                      Icon(Icons.square_foot),
                      Text('874 m²'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey, // Set the color to grey
              thickness: 1.0,     // Thickness of the divider
              height: 20.0,       // Space around the divider
              indent: 20.0,       // Space before the divider starts
              endIndent: 20.0,    // Space after the divider ends
            ),
            // Owner details
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_vector-1720601330464-72e2e9c3bc90?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA5fHxwcm9maWxlJTIwcGhvdG98ZW58MHx8MHx8fDA%3D'
                ),
              ),
              title: Text('Bhuwan K.C'),
              subtitle: Text('Property owner'),
              trailing: IconButton(
                icon: Icon(Icons.phone),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 10),
            // Home facilities
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Home facilities',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'See all facilities',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _buildFacilityIcon(Icons.ac_unit, 'Air conditioner'),
                  _buildFacilityIcon(Icons.kitchen, 'Kitchen'),
                  _buildFacilityIcon(Icons.local_parking, 'Free parking'),
                  _buildFacilityIcon(Icons.wifi, 'Free WIFI'),
                ],
              ),
            ),

            // Map widget (placeholder for actual map widget)
            Container(
              height: 200,
              color: Colors.grey[300],
              margin: EdgeInsets.all(16.0),
              child: Center(child: Text('Map placeholder')),
            ),

            // Nearest public facilities
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nearest Public Facilities',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  _buildFacilityIcon(Icons.store, 'Minimarket'),
                  _buildFacilityIcon(Icons.local_hospital, 'Hospital'),
                  _buildFacilityIcon(Icons.restaurant, 'Public canteen'),
                  _buildFacilityIcon(Icons.train, 'Train station'),
                ],
              ),
            ),
            // About section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About location\'s neighborhood',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This cabin comes with smart home system and beautiful viking style. You can see sunrise in the morning with city view from full glass window',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Color(0xFF7D7F88),
                    ),
                  ),
                ],
              ),
            ),
            // buttons
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                    label: 'Edit',
                    width: 170,
                    onPressed: () {
                      //perform action
                    },
                  ),
                  Spacer(),
                  CustomButton(
                    label: 'Delete',
                    width: 170,
                    onPressed: () {
                      //perform action
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildFacilityIcon(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 50),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          )
        ),
      ],
    );
  }
}
