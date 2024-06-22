import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import your CustomAppBar widget
import '../widgets/menu_1.dart'; // Import your Menu widget
import '../widgets/footer.dart'; 
class HomeScreenJoin extends StatelessWidget {
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
            Center(child: MenuJoin()), // Include your Menu widget here
              SizedBox(height: 40), // Add spacing between Menu and Footer
            Footer(),
          ],
        ),
      ),
      
    );
  }
}
