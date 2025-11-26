// ignore_for_file: unused_import

import 'package:flutter/material.dart';

// Import all pages
import 'home_nav.dart' show AboutAppPage;
import 'lesson_details.dart';
import 'about_sdg4.dart';
import 'splash_screen.dart';
import 'quiz_page.dart';
import 'about_app_page.dart' hide AboutAppPage; // Add this import if AboutAppPage is defined in about_app_page.dart

void main() {
  runApp(EqualLearnApp());
}

class EqualLearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EqualLearn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: SplashScreen(), // Start with splash screen
      debugShowCheckedModeBanner: false,
    );
  }
}

// ---------------- Home Navigation ----------------
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

// ---------------- Home Page ----------------
class HomePage extends StatelessWidget {
  final List<Map<String, String>> lessons = [
    {"title": "Math Basics", "content": "Learn counting, addition, subtraction, and simple shapes."},
    {"title": "English Basics", "content": "Learn letters, reading simple words, and building vocabulary."},
    {"title": "Science Basics", "content": "Learn about weather, plants, animals, and simple science facts."},
    {"title": "Social Studies", "content": "Learn about community helpers, maps, and culture."},
    {"title": "Environmental Care", "content": "Learn how to keep the environment clean and why it matters."},
    {"title": "Life Skills", "content": "Learn honesty, sharing, cleanliness, and good manners."},
  ];

  final List<IconData> icons = [
    Icons.calculate,
    Icons.menu_book,
    Icons.science,
    Icons.public,
    Icons.eco,
    Icons.star,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EqualLearn")),
      body: Column(
        children: [
          // Header banner with gradient
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.blue.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              "Welcome to EqualLearn! 📚",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          // Lessons list
          Expanded(
            child: ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  shadowColor: Colors.blue.shade100,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade50,
                      child: Icon(icons[index], color: Colors.blue),
                    ),
                    title: Text(
                      lessons[index]["title"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(lessons[index]["content"]!),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonDetails(
                            title: lessons[index]["title"]!,
                            content: lessons[index]["content"]!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Floating quiz button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.quiz),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizPage()),
          );
        },
      ),
    );
  }
}
