import 'package:flutter/material.dart';
import 'package:sparanghel/models/quiz.dart';

class QuizPage extends StatefulWidget {
  final Quiz quiz;

  const QuizPage({Key? key, required this.quiz}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.quiz.problems[0].body,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: widget.quiz.problems[0].options.map((e) {
                _index++;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (widget.quiz.problems[0].ans ==
                            widget.quiz.problems[0].options.indexOf(e)) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(e.toString()),
                    ),
                  ),
                );
              }).toList(),
            )

            // Row(
            //   children: [
            //     const SizedBox(
            //       width: 30,
            //     ),
            //     Expanded(
            //       child: ElevatedButton(
            //           onPressed: () {},
            //           child: Text(widget.quiz.problems[0].options[0])),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Expanded(
            //       child: ElevatedButton(
            //           onPressed: () {},
            //           child: Text(widget.quiz.problems[0].options[1])),
            //     ),
            //     const SizedBox(
            //       width: 30,
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   children: [
            //     const SizedBox(
            //       width: 30,
            //     ),
            //     Expanded(
            //       child: ElevatedButton(
            //           onPressed: () {},
            //           child: Text(widget.quiz.problems[0].options[2])),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     const SizedBox(),
            //     Expanded(
            //       child: ElevatedButton(
            //           onPressed: () {},
            //           child: Text(widget.quiz.problems[0].options[3])),
            //     ),
            //     const SizedBox(
            //       width: 30,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
