import 'package:sparanghel/models/lesson.dart';
import 'package:sparanghel/models/quiz.dart';

class Course {
  String name;
  String icon;
  Quiz quiz;
  Lesson lesson;

  Course(this.name, this.icon, this.quiz, this.lesson);
}
