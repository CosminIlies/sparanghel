import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sparanghel/models/problem.dart';
import 'package:sparanghel/models/quiz.dart';
import 'package:sparanghel/services/auth.dart';
import 'package:sparanghel/services/database.dart';

class QuizPage extends StatefulWidget {
  final Quiz quiz;

  const QuizPage({Key? key, required this.quiz}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _index = 0;
  List<Problem> porblems = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.quiz.nrOfProblems; i++) {
      int _rand = Random().nextInt(widget.quiz.problems.length);
      porblems.add(widget.quiz.problems[_rand]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                (_index + 1).toString() +
                    ". " +
                    porblems[_index].body.replaceAll(r'\n', '\n'),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: porblems[_index].options.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (porblems[_index].ans ==
                            porblems[_index].options.indexOf(e)) {
                          if (_index + 1 >= porblems.length) {
                            DatabaseService.updateUserPoints(
                                AuthService.user!.points + widget.quiz.points);
                            Navigator.of(context).pop(context);
                          } else {
                            setState(() {
                              _index++;
                            });
                          }
                        } else {
                          Navigator.of(context).pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        primary: const Color(0xFFB33030),
                      ),
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
