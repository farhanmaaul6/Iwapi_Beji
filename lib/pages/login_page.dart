import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iwapi_beji/components/NavbarUser.dart';
import 'package:iwapi_beji/components/reusable_widget.dart';
import 'package:iwapi_beji/components/Navbar.dart';
import 'package:iwapi_beji/pages/Home_Page/home_pageAdmin.dart';
import 'package:iwapi_beji/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  final String adminEmail = 'iwapi@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo_iwapi.png"),
                SizedBox(height: 40),
                reusableTextField(
                  "Email",
                  Icons.mail,
                  false,
                  _emailTextController,
                ),
                SizedBox(height: 10),
                reusableTextField(
                  "Password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                SizedBox(height: 30),
                SignInSignUpButton(
                  context,
                  true,
                  () {
                    final email = _emailTextController.text;
                    final password = _passwordTextController.text;

                    if (email == adminEmail) {
                      // Admin login
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      )
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavbarPageAdmin(),
                          ),
                        );
                      }).catchError((error) {
                        print("Error ${error.toString()}");
                      });
                    } else {
                      // User login
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      )
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavbarPageUser(),
                          ),
                        );
                      }).catchError((error) {
                        print("Error ${error.toString()}");
                      });
                    }
                  },
                ),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.blue)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()),
            );
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
