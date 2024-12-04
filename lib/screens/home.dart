import 'package:flutter/material.dart';
import 'package:task1/models/quizData.dart';
import 'package:task1/widgets/CustomDialog.dart';
import 'package:task1/widgets/CutomOptionButton.dart';
import 'package:task1/widgets/CustomElevatedButton.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _selectedOption = -1;
  int _score = 0;
  final QuestionData _questionData = QuestionData();

  void _nextQuestion() {
    setState(() {
      if (_selectedOption == _questionData.currentQuestion.correctAnswerIndex) {
        _score += 15;
      }

      _questionData.answerQuestion(_selectedOption);

      if (_questionData.hasNextQuestion) {
        _selectedOption = -1;
        _questionData.nextQuestion();
      } else {
        _showDialog();
      }
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          score: _score,
          onRestart: () {
            setState(() {
              _questionData.resetQuiz();
              _score = 0;
              _selectedOption = -1;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questionData.currentQuestion;
    final options = currentQuestion.answers;
    final totalQuestions = _questionData.totalQuestions;
    final currentIndex = _questionData.currentIndex;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          'Nolan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.stars,
                          color: Color(0xFFDEB171),
                          size: 36,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '$_score',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 15,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        currentQuestion.question,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Positioned(
                      top: -45,
                      left: MediaQuery.of(context).size.width / 2 -
                          65, // Centered
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/logo.jpg'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ...options.asMap().entries.map((entry) {
                  int index = entry.key;
                  String option = entry.value;
                  return Column(
                    children: [
                      CustomOptionButton(
                        index: index,
                        option: option,
                        selectedOption: _selectedOption,
                        onTap: () {
                          setState(() {
                            _selectedOption = index;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  onPressed: _selectedOption != -1 ? _nextQuestion : () {},
                  text: 'Next',
                  isEnabled: _selectedOption != -1,
                ),
                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: totalQuestions > 0 ? currentIndex / totalQuestions : 0,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
