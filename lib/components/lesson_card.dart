import 'package:flutter/material.dart';
import 'package:sparanghel/models/quiz.dart';
import 'package:sparanghel/pages/quiz.dart';
import 'package:sparanghel/services/database.dart';

class LessonCard extends StatefulWidget {
  final Quiz quiz;
  const LessonCard({Key? key, required this.quiz}) : super(key: key);

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFD3ECA7),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                'https://picsum.photos/250?image=9',
                width: 75,
              ),
              Text(
                widget.quiz.name,
                style: const TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Take course"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12.0),
                  primary: const Color(0xFFB33030),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuizPage(
                        quiz: widget.quiz,
                      ),
                    ),
                  );
                },
                child: const Text("Take quiz"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12.0),
                  primary: const Color(0xFFB33030),
                ),
              ),
              Text(
                widget.quiz.points.toString() + " P",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
