import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
            child: iconOrImage),
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

Widget buildSectionTwo(
    String titleTextTwo, IconData iconDataTwo, Widget etudiantsWidget) {
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
              fontFamily: 'Poppins',
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
              fontFamily: 'Poppins',
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

class AnimatedTitle extends StatefulWidget {
  @override
  _AnimatedTitleState createState() => _AnimatedTitleState();
}

class _AnimatedTitleState extends State<AnimatedTitle> {
  bool showFirst = false;
  bool showSecond = false;
  bool showThird = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() async {
    setState(() {
      showFirst = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      showSecond = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      showThird = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 192,
        height: 103,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showFirst)
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'CREATE',
                    textStyle: TextStyle(
                      color: Color(0xFFFFB703),
                      fontSize: 24.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                isRepeatingAnimation: false,
              ),
            if (showSecond)
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'YOUR SUCCESS',
                    textStyle: TextStyle(
                      color: Color(0xFF023047),
                      fontSize: 24.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                isRepeatingAnimation: false,
              ),
            if (showThird)
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'WITH US!',
                    textStyle: TextStyle(
                      color: Color(0xFFFB8500),
                      fontSize: 24.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                isRepeatingAnimation: false,
              ),
          ],
        ));
  }
}

class NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return NotificationList();
          },
        );
      },
      child: Container(
        width: 33.12,
        height: 34,
        decoration: BoxDecoration(
          color: Color(0xFFFFB703),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(
          Icons.notifications,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notifications',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with your actual notification count
              itemBuilder: (context, index) {
                return Container(
                    height: 100,
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.0),
                      border: Border.all(
                        color: Color(0xFFFFB703),
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/images/fst.png', width: 90),
                        SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0), // Example padding
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'a accepté votre demande actuelle d\'Inscription',
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Color(0xFF023047),
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '10 Juillet 2024, 14:05:55',
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Color(0xFF023047),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
