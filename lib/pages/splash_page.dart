import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iwapi_beji/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_iwapi.png',
              width: 250,
              height: 250,
            ),
            SizedBox(height: 30),
            Text(
              'IWAPI RANTING BEJI',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 38,
                height: 1,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            SpinKitFadingCube(
              color: Colors.indigo,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
