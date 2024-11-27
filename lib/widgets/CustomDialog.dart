import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final int score;
  final VoidCallback onRestart;

  const CustomDialog({
    super.key,
    required this.score,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(
            Icons.quiz,
            color: Colors.teal,
            size: 30,
          ),
          // SizedBox(width: 8),
          Spacer(),
          Text(
            'Quiz Over!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Text('Your score is $score. Do you want to restart the quiz?'),
      actions: <Widget>[
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.tealAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
            child: const Text('Restart'),
            onPressed: () {
              onRestart();
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
