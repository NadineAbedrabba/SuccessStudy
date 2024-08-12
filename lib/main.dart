import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/forgot_password_Screen.dart';
import 'package:flutter_application_1/screens/home_screen_university.dart';
import 'package:flutter_application_1/screens/home_screen_join.dart';
import 'package:flutter_application_1/screens/home_screen_etudiant.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/packs_screen.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:flutter_application_1/screens/destinations_screen.dart';
import 'package:flutter_application_1/screens/verification_screen.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _initDeepLinkListener();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  void _handleDeepLink(Uri uri) {
    // Extract the token from the URI
    if (uri.pathSegments.length >= 2 && uri.pathSegments[0] == 'verif') {
      final token = uri.pathSegments[1];
      print('token: $token');
      _navigatorKey.currentState?.pushReplacementNamed('/verif/$token', arguments: token);
    }
  }

  void _initDeepLinkListener() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        print('uri: $uri');
        _handleDeepLink(uri);
      }
    }, onError: (Object err) {
      // Handle exception
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/home/university': (context) => HomeScreenUniversity(),
        '/home/join': (context) => HomeScreenJoin(),
        '/home/etudiant': (context) => HomeScreenEtudiant(),
        '/destinations': (context) => DestinationsScreen(),
        '/packs': (context) => PacksScreen(),
        '/profile': (context) => ProfileScreen(),
        '/forgot-password': (context) => ForgotPassScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name != null && settings.name!.startsWith('/verif/')) {
          print(settings.name);
          final token = settings.name!.substring('/verif/'.length);
          print('token from g: $token');
          return MaterialPageRoute(
            builder: (context) => VerificationScreen(token: token),
          );
        }
        return null;
      },
    );
  }
}
