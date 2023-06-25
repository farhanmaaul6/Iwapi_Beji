import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePageAdmin extends StatefulWidget {
  const ProfilePageAdmin({Key? key}) : super(key: key);

  @override
  State<ProfilePageAdmin> createState() => _ProfilePageAdminState();
}

class _ProfilePageAdminState extends State<ProfilePageAdmin> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 8,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profile Page',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60.0,
                          backgroundImage:
                              AssetImage('assets/images/logo_iwapi.png'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'IWAPI',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ranting Beji',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
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
                      leading: Icon(Icons.location_on),
                      title: Text('Beji, Kota Depok, Jawa Barat'),
                    ),
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text('087880624699'),
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                          onTap: () {
                            signUserOut();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/loginpage',
                              (route) => false,
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.assignment_ind),
                          title: Text('Tentang'),
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/tentangpageadmin');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
