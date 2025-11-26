import 'package:flutter/material.dart';

class AboutSDG4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About SDG 4"),
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
                  "SDG 4: Quality Education",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              // Content
              Text(
                "SDG 4 aims to ensure inclusive and equitable quality education "
                "and promote lifelong learning opportunities for all.\n\n"
                "Many children — especially from rural areas or low-income families — "
                "miss out on learning due to lack of teachers, books, school fees, or distance.\n\n"
                "EqualLearn supports SDG 4 by providing simple, accessible lessons "
                "any child can learn from, even without internet or schooling resources.",
                style: TextStyle(fontSize: 18, height: 1.5),
              ),
              SizedBox(height: 24),
              // Visual suggestion / icon
              Center(
                child: Icon(Icons.school, size: 80, color: Colors.blue.shade400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
