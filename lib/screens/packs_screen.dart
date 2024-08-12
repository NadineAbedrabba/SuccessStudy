import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/espace_etudiant_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_application_1/widgets/custom_app_bar_2.dart';

class PacksScreen extends StatefulWidget {
  const PacksScreen({super.key});

  @override
  _PacksScreenState createState() => _PacksScreenState();
}

class _PacksScreenState extends State<PacksScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Adjust height as needed
        child: CustomAppBar2(), // Use your CustomAppBar here
      ),
       drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(0.0), // Adjust padding as needed
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Nos Packs',
                style: TextStyle(
                  color: Color(0xFFFFB703),
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Style Script',
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  _buildPackPage(
                    context,
                    'Pack Admission',
                    '✔️ Conseil et orientation \n Personnalisé\n'
                        '✔️ Intégrer une école privée / Publique\n'
                        '✔️ Accompagnement VISA',
                  ),
                  _buildPackPage(
                    context,
                    'Pack Logement',
                    '✔️ Conseil et orientation Personnalisé\n'
                        '✔️ Recherche Logement \n "foyer universitaires / \n Collocation"\n'
                        '✔️ Accompagnement VISA',
                  ),
                  _buildPackPage(
                    context,
                    'Pack Complet',
                    '✔️ Admission\n'
                        '✔️ Logement\n'
                        '✔️ Accompagnement \n VISA',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: WormEffect(
                dotHeight: 8.0,
                dotWidth: 8.0,
                activeDotColor: Colors.orange,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPackPage(
      BuildContext context, String title, String description) {
    return Center(
      child: Container(
        width: 270,
        height: 495.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/phone.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Style Script',
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    height: 2,
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
