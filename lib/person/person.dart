import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  final String name;
  final String email;
  final String profilePictureUrl;

  // You can replace these with actual user data from your backend or provider
  const PersonScreen({
    Key? key,
    this.name = "Taher farh",
    this.email = "Taher.farh@gmail.com",
    this.profilePictureUrl = "assets/images/Screenshot 2024-02-08 180955.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color.fromARGB(255, 238, 167, 52),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    "assets/images/Screenshot 2024-02-08 180955.png")),
            const SizedBox(height: 16),
            // Name
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Email
            Text(
              email,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            // Additional Information
            const Text(
              "Additional Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Address Card
            _buildInfoCard("Address", "75 Main St, Giza, Eg"),
            // Phone Card
            _buildInfoCard("Phone", "(+20)10055889966"),
            // Birthday Card
            _buildInfoCard("Birthday", "june 18, 2002"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String subtitle) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
