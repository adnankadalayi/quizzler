import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Quizzler(),
    );
  }
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getAnswerText();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(context: context, title: "OVER", desc: "The Quiz is Over.")
            .show();
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ),
          Row(children: scoreKeeper),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// //TODO: Step 2 - Import the rFlutter_Alert package here.
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'quiz_brain.dart';

// QuizBrain quizBrain = QuizBrain();

// void main() => runApp(Quizzler());

// class Quizzler extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey.shade900,
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: QuizPage(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuizPage extends StatefulWidget {
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   List<Icon> scoreKeeper = [];

//   void checkAnswer(bool userPickedAnswer) {
//     bool correctAnswer = quizBrain.getCorrectAnswer();

//     setState(() {
//       //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
//       //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
//       if (quizBrain.isFinished() == true) {
//         //TODO Step 4 Part A - show an alert using rFlutter_alert,

//         //This is the code for the basic alert from the docs for rFlutter Alert:
//         //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

//         //Modified for our purposes:
//         Alert(
//           context: context,
//           title: 'Finished!',
//           desc: 'You\'ve reached the end of the quiz.',
//         ).show();

//         //TODO Step 4 Part C - reset the questionNumber,
//         quizBrain.reset();

//         //TODO Step 4 Part D - empty out the scoreKeeper.
//         scoreKeeper = [];
//       }

//       //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
//       else {
//         if (userPickedAnswer == correctAnswer) {
//           scoreKeeper.add(Icon(
//             Icons.check,
//             color: Colors.green,
//           ));
//         } else {
//           scoreKeeper.add(Icon(
//             Icons.close,
//             color: Colors.red,
//           ));
//         }
//         quizBrain.nextQuestion();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Center(
//               child: Text(
//                 quizBrain.getQuestionText(),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 checkAnswer(true);
//               },
//               child: Text(
//                 'True',
//                 style: TextStyle(fontSize: 20),
//               ),
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 checkAnswer(false);
//               },
//               child: Text(
//                 'False',
//                 style: TextStyle(fontSize: 20),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//               ),
//             ),
//           ),
//         ),
//         Row(
//           children: scoreKeeper,
//         )
//       ],
//     );
//   }
// }
