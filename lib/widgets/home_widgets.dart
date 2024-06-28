import 'package:flutter/material.dart';
Widget buildSectionOne(String titleTextOne, Widget iconOrImage) {
  return Container(
    width: 250,
    height: 83.33,
    decoration: const BoxDecoration(color: Color(0xFFFFB703)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 65, // Largeur de l'image
          height: 35, // Hauteur de l'image
          child: iconOrImage
        ),
        SizedBox(height: 9), // Espace entre l'image et le texte
        Text(
          titleTextOne,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF023047),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ],
    ),
  );
}

Widget buildSectionTwo(String titleTextTwo, IconData iconDataTwo, Widget etudiantsWidget) {
  return Row(children: [
    Container(
      width: 167,
      height: 83.33,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Color(0xFFFFB703)),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 65, // Largeur de l'image
            height: 35, // Hauteur de l'image
            child: Icon(
              iconDataTwo, // Use the icon variable here
              size: 40,
              color: Color(0xFFFFB703),
              // Adjust the size as needed
            ),
          ),
          const SizedBox(height: 9), // Espace entre l'image et le texte
          Text(
            titleTextTwo,
            style: const TextStyle(
              color: Color(0xFFFFB703), // Couleur du texte
              fontSize: 12,
              fontWeight: FontWeight.bold, // Taille de la police
            ),
          ),
        ],
      ),
    ),
    Container(
      width: 83,
      height: 83.33,
      decoration: BoxDecoration(
        color: const Color(0xFF023047), // Couleur de fond avec opacité complète
        border: Border.all(width: 2, color: const Color(0xFFFFB703)),
      ),
      child: etudiantsWidget,
    ),
  ]);
}

Widget buildSectionThree() {
  return Row(children: [
    Container(
      width: 83,
      height: 83.33,
      decoration: BoxDecoration(
        color: const Color(0xFFFFB703),
        border: Border.all(width: 2, color: const Color(0xFFFFB703)),
        image: const DecorationImage(
          image: AssetImage("assets/images/guideUtil.png"),
        ),
      ),
    ),
    Container(
      width: 167,
      height: 83.33,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/guide.png"),
          fit: BoxFit.fill,
        ),
        border: Border.all(width: 2, color: const Color(0xFFFFB703)),
      ),
    ),
  ]);
}

Widget buildSectionFour(Widget transactionWidget) {
  return Row(children: [
    Container(
      width: 167,
      height: 83,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: const Color(0xFFFFB703)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 65, // Largeur de l'image
            height: 35, // Hauteur de l'image
            child: Image(
              image: AssetImage("assets/images/mail.png"),
              // fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 3), // Espace entre l'image et le texte
          Text(
            'Contactez-nous',
            style: TextStyle(
              color: Color(0xFFFFB703), // Couleur du texte
              fontSize: 12,
              fontWeight: FontWeight.bold, // Taille de la police
            ),
          ),
        ],
      ),
    ),
    Container(
      width: 83,
      height: 83.33,
      decoration: BoxDecoration(
        color: const Color(0xFF023047),
        border: Border.all(width: 2, color: const Color(0xFFFFB703)),
      ),
      child: transactionWidget,
    ),
  ]);
}

Widget eiffelPic = Container(
  width: 83,
  height: 83.33,
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/eiffel.png"),
      fit: BoxFit.fill,
    ),
    border: Border(
      left: BorderSide(width: 2, color: Color(0xFFFFB703)),
      top: BorderSide(width: 2, color: Color(0xFFFFB703)),
      right: BorderSide(width: 2, color: Color(0xFFFFB703)),
      bottom: BorderSide(width: 2, color: Color(0xFFFFB703)),
    ),
  ),
);
Widget nosPacks = Container(
  width: 53,
  height: 64,
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/packs.png"),
      fit: BoxFit.fill,
    ),
  ),
);
