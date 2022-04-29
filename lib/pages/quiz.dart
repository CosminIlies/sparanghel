import 'package:flutter/material.dart';
import 'package:sparanghel/models/problem.dart';

class QuizPage extends StatefulWidget {
  final Problem problem;

  const QuizPage({Key? key, required this.problem}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.problem.body),
    );
  }
}
