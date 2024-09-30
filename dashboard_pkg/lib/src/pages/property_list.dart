// import
import 'package:flutter/material.dart';
import '../widgets/property_card.dart';

// widget
class PropertyListPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
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
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://plus.unsplash.com/premium_vector-1720601330464-72e2e9c3bc90?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA5fHxwcm9maWxlJTIwcGhvdG98ZW58MHx8MHx8fDA%3D', // Profile image URL
                ),
              ),
            ),
            SizedBox(width: 10), // Spacing between the profile icon and search bar
            // Search field in the middle
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Jakarta, Indonesia',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          // Handle search logic
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            // Filter button on the right
            GestureDetector(
              onTap: () {
                // Handle filter action
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.filter_list, color: Colors.white),
              ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PropertyCard(
                    imageUrl: 'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Property image
                    title: 'Entire private villa in Surabaya City',
                    location: 'Narayanter, Near bimal\'s Villa',
                    price: 'KSH 400 / month',
                    rating: 4.9,
                    reviews: 104,
                    rooms: 2,
                    area: '488 m²',
                  ),
                  PropertyCard(
                    imageUrl: 'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Property image
                    title: 'Entire private villa in Surabaya City',
                    location: 'Narayanter, Near bimal\'s Villa',
                    price: 'KSH 400 / month',
                    rating: 4.9,
                    reviews: 104,
                    rooms: 2,
                    area: '488 m²',
                  ),
                  PropertyCard(
                    imageUrl: 'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Property image
                    title: 'Entire private villa in Surabaya City',
                    location: 'Narayanter, Near bimal\'s Villa',
                    price: 'KSH 400 / month',
                    rating: 4.9,
                    reviews: 104,
                    rooms: 2,
                    area: '488 m²',
                  ),
                  PropertyCard(
                    imageUrl: 'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Property image
                    title: 'Entire private villa in Surabaya City',
                    location: 'Narayanter, Near bimal\'s Villa',
                    price: 'KSH 400 / month',
                    rating: 4.9,
                    reviews: 104,
                    rooms: 2,
                    area: '488 m²',
                  ),
                  PropertyCard(
                    imageUrl: 'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Property image
                    title: 'Entire private villa in Surabaya City',
                    location: 'Narayanter, Near bimal\'s Villa',
                    price: 'KSH 400 / month',
                    rating: 4.9,
                    reviews: 104,
                    rooms: 2,
                    area: '488 m²',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}