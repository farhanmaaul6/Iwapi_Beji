import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                signUserOut();
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/loginpage',
                    (route) =>
                        false); // Navigasi ke halaman login dan menghapus semua halaman sebelumnya dari stack
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/images/logo_iwapi.png'),
              ),
              SizedBox(height: 16.0),
              Text(
                'IWAPI',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Ranting Beji',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16.0),
              Divider(),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  currentUser.email!,
                  textAlign: TextAlign.left,
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('+1234567890'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('New York, USA'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
