import 'package:flutter/material.dart';
import 'package:iwapi_beji/components/Navbar.dart';
import 'package:iwapi_beji/firebase_options.dart';
import 'package:iwapi_beji/pages/add_page.dart';
import 'package:iwapi_beji/pages/home_page.dart';
import 'package:iwapi_beji/pages/login_page.dart';
import 'package:iwapi_beji/pages/onboarding_page.dart';
import 'package:iwapi_beji/pages/profile_page.dart';
import 'package:iwapi_beji/pages/register_page.dart';
import 'package:iwapi_beji/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IWAPI BEJI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => SplashPage(),
        '/onboardingpage': (context) => OnboardingPage(),
        '/loginpage': (context) => LoginPage(),
        '/registerpage': (context) => RegisterPage(),
        '/homepage': (context) => HomePage(),
        '/Navbarpage': (context) => NavbarPage(),
        '/addpage': (context) => AddPage(),
        '/profilepage': (context) => ProfilePage(),
      },
    );
  }
}
