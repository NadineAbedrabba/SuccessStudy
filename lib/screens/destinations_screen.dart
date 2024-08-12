import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_app_bar_2.dart';
import 'package:flutter_application_1/widgets/espace_etudiant_widgets.dart';

class DestinationsScreen extends StatefulWidget {
  @override
  _DestinationsScreenState createState() => _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
  final List<Map<String, String>> destinations = [
    {
      'image': 'assets/images/france_swiper_1.png',
      'name': 'France',
      'description':
          'La France, officiellement connue sous le nom de République française, est un pays diversifié et culturellement riche situé en Europe occidentale. Elle partage ses frontières avec plusieurs pays, dont la Belgique, le Luxembourg, l\'Allemagne, la Suisse, l\'Italie, l\'Espagne et l\'Andorre. De plus, elle possède des côtes le long de la mer Méditerranée, de l\'océan Atlantique et de la Manche.',
    },
    {
      'image': 'assets/images/tunisia_swiper.png',
      'name': 'Tunisie',
      'description':
          'La Tunisie, officiellement connue sous le nom de République tunisienne, est un pays situé en Afrique du Nord, sur la côte méditerranéenne. Elle partage ses frontières avec l\'Algérie à l\'ouest et la Libye à l\'est. La Tunisie a une riche histoire qui remonte à l\'époque des anciennes civilisations, telles que les Phéniciens, les Romains et les Arabes, qui ont laissé leur empreinte sur le pays.',
    },
    {
      'image': 'assets/images/belgique_swiper.png',
      'name': 'Belgique',
      'description':
          'La Belgique est un petit pays situé en Europe occidentale, partageant ses frontières avec la France, les Pays-Bas, l\'Allemagne et le Luxembourg. Malgré sa taille modeste, la Belgique est connue pour sa riche histoire, sa ...',
    },
    {
      'image': 'assets/images/canada_swiper.png',
      'name': 'Canada',
      'description':
          'Le Canada est un vaste pays situé en Amérique du Nord, s\'étendant de l\'océan Atlantique à l\'océan Pacifique et au nord jusqu\'à l\'Arctique. Le Canada est connu pour ses vastes paysages naturels, ses villes multiculturelles et sa riche histoire ...',
    },
  ];

  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredDestinations =
        selectedCountry == null || selectedCountry == 'Tous'
            ? destinations
            : destinations
                .where((destination) => destination['name'] == selectedCountry)
                .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Adjust height as needed
        child: CustomAppBar2(), // Use your CustomAppBar here
      ),
       drawer: CustomDrawer(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Destinations',
                style: TextStyle(
                    color: Color(0xFFFFB703),
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Style Script'),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                width: 256,
                height: 34,
                decoration: BoxDecoration(
                  color: Color(0xFFFFB703),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(
                      'Choisissez un pays',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    value: selectedCountry,
                    isExpanded: true,
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Tous',
                        child: Text(
                          'Tous',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      ...destinations.map((Map<String, String> destination) {
                        return DropdownMenuItem<String>(
                          value: destination['name'],
                          child: Text(
                            destination['name']!,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        );
                      }).toList(),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountry = newValue;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredDestinations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: 285,
                      height: 200,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set your desired border radius
                              child: Image.asset(
                                filteredDestinations[index]['image']!,
                                width: 100,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          filteredDestinations[index]['name']!,
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF219EBC),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              118.0, // Set your desired width
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Handle explore button tap
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromRGBO(255, 183,
                                                      3, 1), // Background color
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Explorer',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      filteredDestinations[index]
                                          ['description']!,
                                      style: TextStyle(
                                          color: Color(0xFFF023047),
                                          fontFamily: 'Poppins',
                                          fontSize: 14),
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
