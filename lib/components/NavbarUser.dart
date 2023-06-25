import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iwapi_beji/pages/Home_Page/Home_pageUser.dart';
import 'package:iwapi_beji/pages/Profile/profile_pageUser.dart';
import 'package:iwapi_beji/pages/add_page.dart';
import 'package:iwapi_beji/pages/Home_Page/home_pageAdmin.dart';

class NavbarPageUser extends StatefulWidget {
  const NavbarPageUser({super.key});

  @override
  State<NavbarPageUser> createState() => _NavbarPageUserState();
}

class _NavbarPageUserState extends State<NavbarPageUser> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePageUser(),
    ProfilePageUser(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade200,
        color: Colors.blue.shade300,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          _onItemTapped(index);
        },
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
