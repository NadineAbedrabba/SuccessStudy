import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import your CustomAppBar widget
import '../widgets/menu.dart'; // Import your Menu widget

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Adjust height as needed
        child: CustomAppBar(), // Use your CustomAppBar here
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0), // Adjust padding as needed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   'Welcome to Home Screen!',
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(height: 20),
            Center(child: Menu()), // Include your Menu widget here
          ],
        ),
      ),
    );
  }
}
