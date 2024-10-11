import 'package:flutter/material.dart';

import '../pages/search_results.dart';
import '../widgets/property_card.dart';
import '../pages/property_detail.dart';
import '../pages/property_list.dart';

class RentaxoHomePage extends StatefulWidget {
  @override
  _RentaxoHomePageState createState() => _RentaxoHomePageState();
}

class _RentaxoHomePageState extends State<RentaxoHomePage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              icon: const Icon(Icons.notifications),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Your current location",
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  ),
              ),
            ),
            _buildLocationBar(),
            _buildSearchBar(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Welcome to Rentaxo",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            _buildButtons(),
            _buildSection("Near your location", _buildNearLocationList()),
            _buildSection("Top rated", _buildNearLocationList()),
            _buildSection("International migrations", _buildNearLocationList()),
            // _buildSection("Top rated", _buildTopRatedList()),
            // _buildSection("International Migrations", _buildInternationalMigrationsList()),
            // _buildHostSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Light background color like the location bar
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(Icons.search, color: Colors.grey),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search address, city, location',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                border: InputBorder.none, // No border to match the rounded background
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              onSubmitted: (value) {
                setState(() {
                  searchQuery = value;
                });
                // Navigate to the Search Results Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResultsPage(searchQuery: searchQuery),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.filter_list, color: Colors.grey),
          ),
        ],
      ),
    );
  }


  Widget _buildLocationBar() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.blue),
          SizedBox(width: 8),
          Text(
            'Boudhha, Kathmandu', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )
          ),
          Spacer(),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('I need to rent'),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: Text('I want to list'),
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget listWidget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                title, 
                style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold
                )
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PropertyListPage()),
                  );
                }, 
                child: Text('See all')),
            ],
          ),
        ),
        listWidget,
      ],
    );
  }

  Widget _buildNearLocationList() {
  return Container(
    height: 300,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildPropertyCard(
          'Luxury apartment',
          '3 rooms, Downtown', // Add location as the subtitle
          '\$850/month',
          'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with actual image URL
          () {
            // Navigate to detail page or perform action on tap
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PropertyDetailPage()),
            );
          },
          4.5,  // Rating
          120,  // Reviews count
          3,    // Number of rooms
          '1500 sq ft',  // Area
        ),
        _buildPropertyCard(
          'Luxury apartment',
          '3 rooms, Downtown', // Add location as the subtitle
          '\$850/month',
          'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with actual image URL
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PropertyDetailPage()),
            );
          },
          4.5,  // Rating
          120,  // Reviews count
          3,    // Number of rooms
          '1500 sq ft',  // Area
        ),
        _buildPropertyCard(
          'Luxury apartment ',
          '3 rooms, Downtown', // Add location as the subtitle
          '\$850/month',
          'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with actual image URL
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PropertyDetailPage()),
            );
          },
          4.5,  // Rating
          120,  // Reviews count
          3,    // Number of rooms
          '1500 sq ft',  // Area
        ),
        _buildPropertyCard(
          'Luxury apartment',
          '3 rooms, Downtown', // Add location as the subtitle
          '\$850/month',
          'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with actual image URL
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PropertyDetailPage()),
            );
          },
          4.5,  // Rating
          120,  // Reviews count
          3,    // Number of rooms
          '1500 sq ft',  // Area
        ),
        _buildPropertyCard(
          'Luxury apartment',
          '3 rooms, Downtown', // Add location as the subtitle
          '\$850/month',
          'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with actual image URL
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PropertyDetailPage()),
            );
          },
          4.5,  // Rating
          120,  // Reviews count
          3,    // Number of rooms
          '1500 sq ft',  // Area
        ),

        // _buildPropertyCard(
        //   'Luxury apartment',
        //   '3 rooms',
        //   '\$850/month',
        //   'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with actual image URL
        //   () {
        //     // Navigate to detail page or perform action on tap
        //     print('Luxury apartment clicked');
        //   },
        // ),
      ],
    ),
  );
}


  Widget _buildTopRatedList() {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // _buildPropertyCard(
          //   'Small cottage with great view',
          //   '2 rooms',
          //   '\$526/month',
          //   'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with actual image URL
          //   () {
          //     // Navigate to detail page or perform action on tap
          //     print('Small cottage clicked');
          //   },
          // ),
          // _buildPropertyCard(
          //   'Luxury apartment',
          //   '3 rooms',
          //   '\$850/month',
          //   'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with actual image URL
          //   () {
          //     // Navigate to detail page or perform action on tap
          //     print('Luxury apartment clicked');
          //   },
          // ),
        ],
      ),
    );
  }


  Widget _buildInternationalMigrationsList() {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // _buildPropertyCard(
          //   'Small cottage with great view',
          //   '2 rooms',
          //   '\$526/month',
          //   'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with actual image URL
          //   () {
          //     // Navigate to detail page or perform action on tap
          //     print('Small cottage clicked');
          //   },
          // ),
          // _buildPropertyCard(
          //   'Luxury apartment',
          //   '3 rooms',
          //   '\$850/month',
          //   'https://images.unsplash.com/photo-1572120360610-d971b9d7767c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D', // Replace with actual image URL
          //   () {
          //     // Navigate to detail page or perform action on tap
          //     print('Luxury apartment clicked');
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildHostSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Want to host your own place?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Active as Landlord',
                  style: TextStyle(color: Colors.purple),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Start Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyCard(
    String title,
    String subtitle,
    String price,
    String imageUrl,
    Function onTap,
    double rating,
    int reviews,
    int rooms,
    String area,
  ) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200, // Adjust width as needed
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Property image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      height: 100,
                      width: double.infinity, // Make image stretch across the width of the card
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Property title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Property location
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Property details (rating, reviews, rooms, area)
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text('$rating'),
                      SizedBox(width: 4),
                      Text('($reviews)'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '$rooms room',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      SizedBox(width: 16),
                      Text(
                        area,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Price
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildMigrationCard(String location, String properties) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(location, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(properties),
          ],
        ),
      ),
    );
  }
}