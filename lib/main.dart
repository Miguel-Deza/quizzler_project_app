import 'package:flutter/material.dart';
import 'package:quizzler_project_app/question.dart';
import 'question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scoreKeeper = [];

  List<Question> questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true)
  ];

  int questionNumber = 0;

  void increaseQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Trivia Game"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  questionBank[questionNumber].questionText,
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      bool correctAnswer =
                          questionBank[questionNumber].questionAnswer;
                      if (correctAnswer == false) {
                        print("user got it right!");
                      } else {
                        print('User got it wrong!');
                      }
                      // Don't forget to update the state with SetState
                      setState(() {
                        increaseQuestion();
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "False",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      bool correctAnswer =
                          questionBank[questionNumber].questionAnswer;
                      if (correctAnswer == true) {
                        print("user got it right!");
                      } else {
                        print('User got it wrong!');
                      }
                      setState(() {
                        increaseQuestion();
                        scoreKeeper.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "True",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(children: scoreKeeper),
          ],
        ),
      ),
    );
  }
}
