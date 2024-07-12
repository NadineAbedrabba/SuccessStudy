import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets.dart';

class MenuJoin extends StatelessWidget {
  const MenuJoin({super.key});

  @override
  Widget build(BuildContext context) {
    String titleTextOne = 'Rejoignez nous';
    Widget iconOrImage = Icon(
      Icons.account_circle, // The icon you want to add
      size: 40, // Adjust the size as needed
      color: Color(0xFF023047), // Adjust the color as needed
    );
    String titleTextTwo = 'Destinations';
    IconData iconDataTwo = Icons.map;
    return SizedBox(
      width: 250,
      height: 340,
      child: Column(
        children: [
          
          buildSectionOne(titleTextOne, iconOrImage),
          buildSectionTwo(titleTextTwo, iconDataTwo, eiffelPic),
          buildSectionThree(),
          buildSectionFour(nosPacks),
        ],
      ),
    );
  }
}



