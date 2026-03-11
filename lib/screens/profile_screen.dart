import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Color(0x12000000), blurRadius: 18, offset: Offset(0, 8)),
              ],
            ),
            child: Column(
              children: const [
                CircleAvatar(radius: 32, child: Icon(Icons.person_outline, size: 34)),
                SizedBox(height: 12),
                Text('Camille Martin', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                SizedBox(height: 4),
                Text('Élève • Orientation en cours', style: TextStyle(color: Color(0xFF6B7280))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
