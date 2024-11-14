import 'package:finance_app/navigation/home.dart';
import 'package:finance_app/navigation/map_sample.dart';
import 'package:finance_app/navigation/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navigation extends StatefulWidget {
  final bool nextButton;
  const Navigation({super.key, required this.nextButton});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int selectedIndex = 0;
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    (() async {
      if (!widget.nextButton) {
        prefs = await SharedPreferences.getInstance();
        bool? isTutorialDone = prefs.getBool('isTutorialDone');
        if (isTutorialDone == null) {
          Navigator.pushReplacementNamed(context, '/tutorial');
        }
      }
    })();
  }

  static const _widgetOptions =  [
    Home(),
    Profile(),
    MapSample()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

      )
    );
  }
}
