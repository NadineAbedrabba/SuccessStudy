import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen_university.dart';
import 'screens/home_screen_join.dart'; // Import your screen widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreenJoin(), // Set HomeScreen as the home screen
    );
  }
}
