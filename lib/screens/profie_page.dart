import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String imageUrl;
  final String company;
  final String location;

  const ProfilePage(
      {super.key,
      required this.username,
      required this.imageUrl,
      required this.company,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '@$username',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),

            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[400]!, width: 1)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet_sharp,
                  color: Colors.blueAccent),
              title: Text(
                'Company: $company',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                // Add functionality here
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.location_city, color: Colors.blueAccent),
              title: Text(
                'Location: $location',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                // Add functionality here
              },
            ),
            // Add more ListTile widgets for additional information if needed
          ],
        ),
      ),
    );
  }
}
