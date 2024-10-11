import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(name: "Yara Khalil", date: "Oct 14, 10:24 AM", amount: -15.00, avatar: Icons.person),
    Transaction(name: "Sara Ibrahim", date: "Oct 12, 02:13 PM", amount: 20.50, avatar: Icons.person),
    Transaction(name: "Ahmad Ibrahim", date: "Oct 11, 01:19 AM", amount: 12.40, avatar: Icons.person),
    Transaction(name: "Reem Khaled", date: "Oct 07, 09:10 PM", amount: -21.30, avatar: Icons.person),
    Transaction(name: "Hiba Saleh", date: "Oct 04, 05:45 AM", amount: 109.00, avatar: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
              'My Wallet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Notification Bell Icon on the right
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Handle notification tap
              },
            ),
          ],
        ),
        automaticallyImplyLeading: false, // Removes default back arrow
      ),
      body: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 20),
          _buildButtons(),
          SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Transactions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Spacer(),
                    Text(
                      'View all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          _buildTransactionList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Balance',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 5),
          Text(
            '\$124.57',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton('Deposit funds', Colors.orange, Icons.send_to_mobile),
          _buildButton('Withdraw funds', Colors.blue, Icons.request_quote),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildTransactionList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return _buildTransactionItem(transaction);
        },
      ),
    );
  }

  Widget _buildTransactionItem(Transaction transaction) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(transaction.avatar, color: Colors.white),
        backgroundColor: Colors.grey,
      ),
      title: Text(transaction.name),
      subtitle: Text(transaction.date),
      trailing: Text(
        transaction.amount > 0
            ? '+\$${transaction.amount.toStringAsFixed(2)}'
            : '-\$${transaction.amount.abs().toStringAsFixed(2)}',
        style: TextStyle(
          color: transaction.amount > 0 ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Transaction {
  final String name;
  final String date;
  final double amount;
  final IconData avatar;

  Transaction({
    required this.name,
    required this.date,
    required this.amount,
    required this.avatar,
  });
}