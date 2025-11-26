import 'package:flutter/material.dart';
import 'about_sdg4.dart';
import 'main.dart';

class HomeNavigation extends StatefulWidget {
  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int currentIndex = 0;

  final pages = [
    HomePage(),
    AboutSDG4(),
    AboutAppPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Lessons",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: "SDG 4",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About",
          ),
        ],
      ),
    );
  }
}

class AboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About EqualLearn")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "EqualLearn is an offline-friendly learning app for children.\n"
          "It supports SDG 4 by giving access to simple lessons regardless of financial background.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
