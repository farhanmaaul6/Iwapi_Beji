import 'package:flutter/material.dart';
import 'package:iwapi_beji/components/Navbar.dart';
import 'package:iwapi_beji/components/NavbarUser.dart';
import 'package:iwapi_beji/components/model.dart';
import 'package:iwapi_beji/firebase_options.dart';
import 'package:iwapi_beji/pages/Profile/profile_pageAdmin.dart';
import 'package:iwapi_beji/pages/Tentang_Page/tentang_pageUser.dart';
import 'package:iwapi_beji/pages/add_page.dart';
import 'package:iwapi_beji/pages/Home_Page/home_pageAdmin.dart';
import 'package:iwapi_beji/pages/login_page.dart';
import 'package:iwapi_beji/pages/onboarding_page.dart';
import 'package:iwapi_beji/pages/register_page.dart';
import 'package:iwapi_beji/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iwapi_beji/pages/Tentang_Page/tentang_pageAdmin.dart';
import 'package:iwapi_beji/pages/update_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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
        '/homepage': (context) => HomePageAdmin(),
        '/Navbarpageadmin': (context) => NavbarPageAdmin(),
        '/Navbarpageuser': (context) => NavbarPageUser(),
        '/addpage': (context) => AddPage(),
        '/tentangpageadmin': (context) => TentangPageAdmin(),
        '/tentangpageuser': (context) => TentangPageUser(),
        '/profilepage': (context) => ProfilePageAdmin(),
        '/Navbarpageuser': (context) => NavbarPageUser(),
      },
    );
  }
}
