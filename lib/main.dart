import 'package:flutter/material.dart';
import 'package:quizlerapp/quezionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());
Quesbrain Q = Quesbrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];
  int count = 0;

  void checkAnswer(bool userAnswer) {
    if (Q.isFinished() == true) {
      print('HO GAYA KHATAM');
      setState(() {
        Alert(
            context: context,
            title: 'Finished!',
            desc: 'You\'ve reached the end of the quiz.',
            style: AlertStyle(overlayColor: Colors.black54),
            buttons: [
              DialogButton(
                child: Text(
                  'Restart',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    //TODO Step 4 Part C - reset the questionNumber,
                    Q.reset();
                    //TODO Step 4 Part D - empty out the scoreKeeper.
                    scorekeeper = [];
                  });
                  Navigator.pop(context);
                },
              )
            ]).show();
      });
    } else {
      setState(() {
        bool correct = Q.getQuesInt();
        if (userAnswer == correct) {
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          count++;
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        Q.getNumber();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    Q.getQuesText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  textColor: Colors.white,
                  child: Text('True'),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  textColor: Colors.white,
                  child: Text('False'),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  color: Colors.green,
                ),
              ),
            ),
            Row(children: scorekeeper),
          ],
        ),
      ),
    );
  }
}
