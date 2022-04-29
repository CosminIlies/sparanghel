import 'package:flutter/material.dart';
import 'package:sparanghel/components/lesson_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const LessonCard(),
              const LessonCard(),
              const LessonCard(),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed("/leaderboard");
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12.0),
                  primary: const Color(0xFFB33030),
                ),
                icon: const Icon(
                  Icons.email,
                ),
                label: const Text(
                  "Leaderboard",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
