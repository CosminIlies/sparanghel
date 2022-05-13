import 'package:flutter/material.dart';
import 'package:sparanghel/models/course.dart';

class LessonPage extends StatefulWidget {
  final Course course;

  const LessonPage({Key? key, required this.course}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.course.name),
        backgroundColor: const Color(0xFFB33030),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text(
                  widget.course.lesson.body[_index].replaceAll(r'\n', '\n'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    prevBtn(context),
                    nextBtn(context),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       setState(() => _index--);
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       padding: const EdgeInsets.all(12.0),
                    //       primary: const Color(0xFFB33030),
                    //     ),
                    //     child: const Text("Previous")),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       setState(() => _index++);
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       padding: const EdgeInsets.all(12.0),
                    //       primary: const Color(0xFFB33030),
                    //     ),
                    //     child: const Text("Next")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget prevBtn(BuildContext context) {
    if (_index > 0) {
      return ElevatedButton(
          onPressed: () {
            setState(() => _index--);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12.0),
            primary: const Color(0xFFB33030),
          ),
          child: const Text("Previous"));
    } else {
      return Container();
    }
  }

  Widget nextBtn(BuildContext context) {
    if (_index < widget.course.lesson.body.length - 1) {
      return ElevatedButton(
          onPressed: () {
            setState(() => _index++);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12.0),
            primary: const Color(0xFFB33030),
          ),
          child: const Text("Next"));
    } else if (_index == widget.course.lesson.body.length - 1) {
      return ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12.0),
            primary: const Color(0xFFB33030),
          ),
          child: const Text("Finish"));
    } else {
      return Container();
    }
  }
}
