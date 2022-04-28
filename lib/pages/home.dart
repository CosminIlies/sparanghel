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
            children: const [
              LessonCard(),
              LessonCard(),
              LessonCard(),
              LessonCard(),
            ],
          ),
        ),
      ),
    );
  }
}
