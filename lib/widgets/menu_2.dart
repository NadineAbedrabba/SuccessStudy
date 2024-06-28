import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets.dart';

class MenuUniversity extends StatelessWidget {
  const MenuUniversity({super.key});

  @override
  Widget build(BuildContext context) {
    String titleTextOne = 'Espace université';
      Widget iconOrImage = Icon(
      Icons.school, // The icon you want to add
      size: 40, // Adjust the size as needed
      color: Color(0xFF023047), // Adjust the color as needed
    );
    String titleTextTwo = 'Mes Formations';
    IconData iconDataTwo = Icons.menu_book;
    return SizedBox(
      width: 250,
      height: 340,
      child: Column(
        children: [
          //one
          buildSectionOne(titleTextOne, iconOrImage),
          buildSectionTwo(titleTextTwo, iconDataTwo, etudiantsWidget),
          buildSectionThree(),
          buildSectionFour(transactionWidget),
        ],
      ),
    );
  }
}

// Define transactionWidget globally or in a scope where it's accessible
Widget transactionWidget = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(
      width: 65, // Largeur de l'image
      height: 35, // Hauteur de l'image
      child: Image(
        image: AssetImage("assets/images/hand.png"),
        // fit: BoxFit.fill,
      ),
    ),
    SizedBox(height: 9), // Espace entre l'image et le texte
    Text(
      'TRANSACTIONS',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white, // Adjust the color as needed
        fontSize: 6.5,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    ),
  ],
);
Widget etudiantsWidget = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const SizedBox(
      width: 65, // Largeur de l'image
      height: 35, // Hauteur de l'image
      child: Image(
        image: AssetImage("assets/images/etudiants.png"),
        // fit: BoxFit.fill,
      ),
    ),
    const SizedBox(height: 3), // Espace entre l'image et le texte
    const Text(
      '96',
      style: TextStyle(
        color: Color(0xFFFFB703), // Couleur du texte
        fontSize: 12,
        fontWeight: FontWeight.bold, // Taille de la police
      ),
    ),
  ],
);
