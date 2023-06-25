import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:iwapi_beji/pages/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: 'Wanita Pengusaha',
          body:
              "Wanita pengusaha adalah teladan bagi generasi selanjutnya. Mereka menunjukkan bahwa wanita juga mampu meraih kesuksesan dalam bisnis. - Arianna Huffington",
          image: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/images/gambar1.png',
              width: 550,
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Wanita Hebat',
          body:
              "Keberanian dan kemandirian seorang wanita dapat membawanya menuju kesuksesan dalam dunia bisnis. - Oprah Winfrey",
          image: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/images/gambar2.png',
              width: 550,
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Wanita Sukses',
          body:
              "Jangan takut untuk memulai bisnis Anda sendiri. Anda memiliki kekuatan dan kemampuan untuk mencapai kesuksesan yang Anda inginkan. - Sophia Amoruso",
          image: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/images/gambar3.png',
              width: 550,
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      showBackButton: false,
      dotsFlex: 3,
      nextFlex: 1,
      back: Icon(Icons.arrow_back),
      skip: Text(
        'Skip',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      next: Icon(Icons.arrow_forward),
      done: Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dotsDecorator: DotsDecorator(
        size: Size(10, 10),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
