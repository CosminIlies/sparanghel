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
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.problem.body,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const SizedBox(),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: Text(widget.problem.options[0])),
                ),
                const SizedBox(
                  width: 20,
                ),
                const SizedBox(),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: Text(widget.problem.options[1])),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const SizedBox(),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: Text(widget.problem.options[2])),
                ),
                const SizedBox(
                  width: 20,
                ),
                const SizedBox(),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: Text(widget.problem.options[3])),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
