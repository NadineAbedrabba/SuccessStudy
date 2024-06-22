import 'package:flutter/material.dart';

class MenuJoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 332.33,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 250,
                  height: 332.33,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 250,
                          height: 83.33,
                          decoration: BoxDecoration(color: Color(0xFFFFB703)),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 15,
                                left:
                                    105, // Center the icon horizontally within the Container (250 - 40)/2 = 105
                                child: Icon(
                                  Icons
                                      .account_circle, // The icon you want to add
                                  size: 40, // Adjust the size as needed
                                  color: Color(
                                      0xFF023047), // Adjust the color as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Positioned(
                      //   left:
                      //       26.5, // Center the icon horizontally within the Container
                      //   top: 0, // Adjust position as needed
                      //   child: Icon(
                      //     Icons.person,
                      //     size: 40, // Adjust size as needed
                      //     color: Color(0xFFFFB703), // Adjust color as needed
                      //   ),
                      // ),
                      Positioned(
                        left: 78,
                        top: 10,
                        child: Container(
                          width: 93,
                          height: 66,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 50,
                                child: Text(
                                  'Rejoignez nous',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF023047),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 166,
                        child: Container(
                          width: 83,
                          height: 83.33,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFB703),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2, color: Color(0xFFFFB703)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 167,
                        top: 249,
                        child: Container(
                          width: 83,
                          height: 83.33,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 83,
                                  height: 83.33,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF023047),
                                    border: Border(
                                      left: BorderSide(
                                          width: 2, color: Color(0xFFFFB703)),
                                      top: BorderSide(
                                          width: 2, color: Color(0xFFFFB703)),
                                      right: BorderSide(
                                          width: 2, color: Color(0xFFFFB703)),
                                      bottom: BorderSide(
                                          width: 2, color: Color(0xFFFFB703)),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 6,
                                child: Container(
                                  width: 53,
                                  height: 64,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 7,
                                        child: Container(
                                          width: 53,
                                          height: 64,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/packs.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Positioned(
                                      //   left: 5,
                                      //   top: 0,
                                      //   child: Container(
                                      //     width: 43,
                                      //     height: 35,
                                      //     decoration: BoxDecoration(
                                      //       image: DecorationImage(
                                      //         image: NetworkImage(
                                      //             "https://via.placeholder.com/43x35"),
                                      //         fit: BoxFit.fill,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 83,
                        top: 166,
                        child: Container(
                          width: 167,
                          height: 83.33,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/guide.png"),
                              fit: BoxFit.fill,
                            ),
                            border: Border(
                              left: BorderSide(
                                  width: 2, color: Color(0xFFFFB703)),
                              top: BorderSide(
                                  width: 2, color: Color(0xFFFFB703)),
                              right: BorderSide(
                                  width: 2, color: Color(0xFFFFB703)),
                              bottom: BorderSide(
                                  width: 2, color: Color(0xFFFFB703)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 188,
                        child: Container(
                          width: 61,
                          height: 39,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 50,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/guideUtil.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 249,
                        child: Container(
                          width: 167,
                          height: 83,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 167,
                                  height: 83,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 15,
                                        left:
                                            60, // Center the icon horizontally within the Container (250 - 40)/2 = 105
                                        child: Image.asset(
                                          'assets/images/mail.png', // Path to your image asset
                                          width:
                                              43.79, // Adjust width as needed
                                          height: 32, // Adjust height as needed
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      left: BorderSide(
                                          width: 2, color: Color(0xFFFFB703)),
                                      top: BorderSide(
                                          width: 2, color: Color(0xFFFFB703)),
                                      right: BorderSide(
                                          width: 2, color: Color(0xFFFFB703)),
                                      bottom: BorderSide(
                                          width: 2, color: Color(0xFFFFB703)),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 14,
                                top: 55,
                                child: SizedBox(
                                  width: 139,
                                  child: Text(
                                    'Contactez-nous',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFFB703),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 167,
                top: 83,
                child: Container(
                  width: 83,
                  height: 83.33,
                  decoration: BoxDecoration(
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
                ),
              ),
              Positioned(
                left: 0,
                top: 83,
                child: Container(
                  width: 167,
                  height: 83.33,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 15,
                        left:
                            60, // Center the icon horizontally within the Container (250 - 40)/2 = 105
                        child: Image.asset(
                          'assets/images/map.png', // Path to your image asset
                          width: 43.79, // Adjust width as needed
                          height: 32, // Adjust height as needed
                        ),
                      ),
                    ],
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Color(0xFFFFB703)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 94,
                child: Container(
                  width: 79,
                  height: 62,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 44,
                        child: Text(
                          'Destinations',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFFB703),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
