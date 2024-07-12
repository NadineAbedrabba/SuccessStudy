import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import your CustomAppBar widget
import '../widgets/menu_2.dart'; // Import your Menu widget
import '../widgets/footer.dart';
import 'package:flutter_application_1/widgets/home_widgets.dart';

class HomeScreenUniversity extends StatelessWidget {
  const HomeScreenUniversity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Adjust height as needed
        child: CustomAppBar(), // Use your CustomAppBar here
      ),
      body: Padding(
        padding: EdgeInsets.all(0.0), // Adjust padding as needed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTitle(),
            SizedBox(height: 20),
            Center(child: MenuUniversity()), // Include your Menu widget here
            SizedBox(height: 40), // Add spacing between Menu and Footer
            Footer(),
          ],
        ),
      ),
    );
  }
}
