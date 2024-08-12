import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/constants.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:flutter_application_1/screens/verification_screen.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routePattern = RegExp(r'^/verif/[\w-_.]+$');

    // Print the route being processed for debugging
    print('Generating route for: ${settings.name}');

    // Check if the route matches '/verif/{token}'
    if (routePattern.hasMatch(settings.name!)) {
      final token = settings.name!.substring('/verif/'.length);
      print('Extracted token: $token');
      return MaterialPageRoute(
        builder: (context) => VerificationScreen(token: token),
      );
    }

    if (settings.name == login) {
      print('Navigating to LoginScreen');
      return MaterialPageRoute(builder: (context) => LoginScreen());
    }

    // Route for signup screen
    if (settings.name == signup) {
      print('Navigating to SignupScreen');
      return MaterialPageRoute(builder: (context) => SignupScreen());
    }
    // Fallback route for undefined routes
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}
