import 'package:flutter/material.dart';
import 'package:iwapi_beji/components/Navbar/NavbarAdmin.dart';
import 'package:iwapi_beji/components/Navbar/NavbarUser.dart';
import 'package:iwapi_beji/components/model.dart';
import 'package:iwapi_beji/firebase_options.dart';
import 'package:iwapi_beji/pages/Home_Page/Home_pageUser.dart';
import 'package:iwapi_beji/pages/Profile/profile_pageAdmin.dart';
import 'package:iwapi_beji/pages/Profile/profile_pageUser.dart';
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
  get nama => null;
  get alamat => null;
  get jenisUsaha => null;
  get perizinan => null;

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
        '/homepageAdmin': (context) => HomePageAdmin(),
        '/homepageUser': (context) => HomePageUser(),
        '/Navbarpageadmin': (context) => NavbarPageAdmin(),
        '/Navbarpageuser': (context) => NavbarPageUser(),
        '/addpage': (context) => AddPage(),
        '/updatepage': (context) => UpdatePage(
            pengurus: Pengurus(
                nama: nama,
                alamat: alamat,
                jenisUsaha: jenisUsaha,
                perizinan: perizinan)),
        '/tentangpageuser': (context) => TentangPageUser(),
        '/profilepageadmin': (context) => ProfilePageAdmin(),
        '/profilepageuser': (context) => ProfilePageUser(),
      },
    );
  }
}
