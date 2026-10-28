import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Colors.black;
    const Color cardColor = Color(0xFF1C1C1E);
    const Color accentColor = Color(0xFFF59E0B);
    const Color textColor = Colors.white70;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Developer Info', style: TextStyle(color: accentColor, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: accentColor),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: accentColor,
                child: Icon(Icons.code, size: 50, color: bgColor),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Developer Profile',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              color: cardColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: Eduardo Hernández', style: TextStyle(color: textColor, fontSize: 16)),
                    SizedBox(height: 8),
                    Text('Field: Systems Engineering', style: TextStyle(color: textColor, fontSize: 16)),
                    SizedBox(height: 8),
                    Text('Project: Mobile Calculator App (Flutter)', style: TextStyle(color: textColor, fontSize: 16)),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: bgColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Back to Calculator', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        ),
    );
  }
}