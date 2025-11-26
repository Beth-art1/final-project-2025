import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  int index = 0;
  TextEditingController answerController = TextEditingController();
  bool? isCorrect; // for feedback

  final List<Map<String, Object>> questions = [
    {"question": "How many legs does a spider have?", "answer": "8"},
    {"question": "What is 2 + 2?", "answer": "4"},
    {"question": "What planet do we live on?", "answer": "Earth"},
  ];

  void checkAnswer() {
    if (answerController.text.trim().toLowerCase() ==
        (questions[index]["answer"] as String).toLowerCase()) {
      score++;
      isCorrect = true;
    } else {
      isCorrect = false;
    }
    setState(() {});
  }

  void nextQuestion() {
    setState(() {
      index++;
      answerController.clear();
      isCorrect = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kids Quiz"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: index < questions.length
            ? Column(
                children: [
                  // Question Card
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        questions[index]["question"] as String,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextField(
                    controller: answerController,
                    decoration: InputDecoration(
                      labelText: "Your answer",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      checkAnswer();
                    },
                    child: Text("Submit"),
                  ),
                  SizedBox(height: 12),
                  if (isCorrect != null)
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isCorrect! ? Colors.green.shade200 : Colors.red.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isCorrect!
                            ? "Correct! ✅"
                            : "Oops! ❌ The correct answer is: ${questions[index]["answer"]}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  if (isCorrect != null)
                    TextButton(
                      onPressed: nextQuestion,
                      child: Text("Next Question"),
                    ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emoji_events, size: 80, color: Colors.blue.shade400),
                    SizedBox(height: 16),
                    Text(
                      "Your Score: $score/${questions.length}",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          score = 0;
                          index = 0;
                          answerController.clear();
                          isCorrect = null;
                        });
                      },
                      child: Text("Restart Quiz"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
