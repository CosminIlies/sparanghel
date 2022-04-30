import 'package:flutter/material.dart';
import 'package:sparanghel/components/lesson_card.dart';
import 'package:sparanghel/models/quiz.dart';
import 'package:sparanghel/services/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lessons"),
        backgroundColor: const Color(0xFFB33030),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: DatabaseService.getAllQuizzes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<Quiz> quizzes = snapshot.data as List<Quiz>;
                    return Column(
                        children: quizzes
                            .map((quiz) => LessonCard(quiz: quiz))
                            .toList());
                  } else {
                    return const Text("loading...");
                  }
                }),
          ),
        ),
      ),
    );
  }
}
