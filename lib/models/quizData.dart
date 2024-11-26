import 'question.dart';

class QuestionData {
  final List<Question> _questions = [
    Question(
      question: 'What is Flutter?',
      answers: [
        'A programming language',
        'A framework',
        'A library',
        'A database management system'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      question:
          'Which of the following is used to manage the state in Flutter?',
      answers: [
        'FutureBuilder',
        'SharedPreferences',
        'SetState',
        'TextField',
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      question: 'Which widget is used to build a button in Flutter?',
      answers: [
        'GestureDetector',
        'Scaffold',
        'Column',
        'ElevatedButton',
      ],
      correctAnswerIndex: 3,
    ),
    Question(
      question:
          'Which of the following is the main entry point for a Flutter app?',
      answers: [
        'main()',
        'initState()',
        'build()',
        'runApp()',
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      question: 'What is the primary language used to write Flutter apps?',
      answers: ['Swift', 'Dart', 'Kotlin', 'JavaScript'],
      correctAnswerIndex: 1,
    ),
  ];

  int _currentIndex = 0;
  int _score = 0;

  List<Question> get questions => _questions;
  int get totalQuestions => _questions.length;
  int get currentIndex => _currentIndex;

  Question get currentQuestion => _questions[_currentIndex];

  bool get hasNextQuestion => _currentIndex < _questions.length - 1;

  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
    }
  }

  void answerQuestion(int selectedOptionIndex) {
    if (selectedOptionIndex == _questions[_currentIndex].correctAnswerIndex) {
      _score += 15;
    }
  }

  int get score => _score;

  void resetQuiz() {
    _currentIndex = 0;
    _score = 0;
  }
}
