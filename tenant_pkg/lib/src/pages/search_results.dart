import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final String searchQuery;

  const SearchResultsPage({Key? key, required this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: searchQuery,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              // Sort function can be implemented here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildMapWithPrices(),
          _buildResultsHeader(),
          _buildResultsList(),
        ],
      ),
    );
  }

  Widget _buildMapWithPrices() {
    return Container(
      height: 150,
      color: Colors.grey.shade200, // Placeholder for a map
      child: Center(
        child: Text(
          'Map with price tags',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buildResultsHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text('Showing 72 results', style: TextStyle(fontWeight: FontWeight.bold)),
          Spacer(),
          Icon(Icons.sort),
          SizedBox(width: 8),
          Text('Sort'),
        ],
      ),
    );
  }

  Widget _buildResultsList() {
    return Expanded(
      child: ListView(
        children: [
          _buildPropertyCard('Small cottage with great view', 'Kadaghari, Kathmandu', '\$526/month'),
          _buildPropertyCard('Private villa in Jakarta City', 'Jakarta, Indonesia', '\$400/month'),
          _buildPropertyCard('Entire rental unit, Puri Orchard', 'Jakarta, Indonesia', '\$1,250/month'),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(String title, String location, String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: Container(
            width: 100,
            height: 80,
            color: Colors.grey.shade300, // Placeholder for image
          ),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(location),
              Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          trailing: Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
