import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets.dart';

class MenuEtudiant extends StatelessWidget {
  const MenuEtudiant({super.key});

  @override
  Widget build(BuildContext context) {
    String titleTextOne = 'Espace etudiant';
    Widget iconOrImage = Image(
              image: AssetImage("assets/images/graduated.png"),
              // fit: BoxFit.fill,
    );
    String titleTextTwo = 'Destinations';
    IconData iconDataTwo = Icons.map;
    return SizedBox(
      width: 250,
      height: 340,
      child: Column(
        children: [
          //one
          buildSectionOne(titleTextOne, iconOrImage),
          buildSectionTwo(titleTextTwo, iconDataTwo, eiffelPic),
          buildSectionThree(),
          buildSectionFour(nosPacks),
        ],
      ),
    );
  }
}
