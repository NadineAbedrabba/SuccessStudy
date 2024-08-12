import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets.dart';
import '../widgets/custom_app_bar_1.dart'; // Import your CustomAppBar widget
import '../widgets/menu_3.dart'; // Import your Menu widget
import '../widgets/footer.dart';

class HomeScreenEtudiant extends StatelessWidget {
  const HomeScreenEtudiant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0 + 20), // Adjust height as needed
          child:
              CustomAppBar(),      // Use your CustomAppBar here
          ),
      body: Padding(
        padding: EdgeInsets.all(0.0), // Adjust padding as needed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTitle(),
            Center(child: MenuEtudiant()), // Include your Menu widget here
            SizedBox(height: 40), // Add spacing between Menu and Footer
            Footer(),
          ],
        ),
      ),
    );
  }
}
