import 'package:sparanghel/models/lesson.dart';
import 'package:sparanghel/models/quiz.dart';

class Course {
  String name;
  Quiz quiz;
  Lesson lesson;

  Course(this.name, this.quiz, this.lesson);
}
