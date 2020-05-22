import 'questions.dart';

class Quesbrain {
  int _quesNum = 0;

  List<Questions> _ques = [
    Questions(q: 'Earth is spherical', a: true),
    Questions(q: 'This is a Windows application', a: false),
    Questions(q: 'Sun rises from east', a: true),
    Questions(q: 'Titanic is a web series', a: false),
    Questions(q: 'You like this App', a: true),
  ];
  void getNumber() {
    if (_quesNum < _ques.length - 1) {
      _quesNum++;
    } else
      _quesNum = -1;
  }

  String getQuesText() {
    if (isFinished()) {
      return 'Finished!\nTap any button to restart.';
    } else {
      return _ques[_quesNum].questionText;
    }
  }

  bool getQuesInt() {
    return _ques[_quesNum].answer;
  }

  bool isFinished() {
    if (_quesNum == -1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _quesNum = 0;
  }
}
