// TODO Implement this library.
import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About EqualLearn"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.blue.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "About EqualLearn",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              // Content
              Text(
                "EqualLearn is an offline-friendly learning app for children.\n\n"
                "It supports SDG 4 by giving access to simple lessons regardless of financial background.\n\n"
                "Created as a submission-ready educational app with an easy-to-use interface, "
                "interactive lessons, and quizzes to make learning fun.",
                style: TextStyle(fontSize: 18, height: 1.5),
              ),
              SizedBox(height: 24),
              Center(
                child: Icon(Icons.apps, size: 80, color: Colors.blue.shade400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
