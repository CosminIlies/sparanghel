import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sparanghel/models/course.dart';
import 'package:sparanghel/models/lesson.dart';
import 'package:sparanghel/models/problem.dart';
import 'package:sparanghel/models/quiz.dart';
import 'package:sparanghel/models/user_model.dart';
import 'package:sparanghel/services/auth.dart';

class DatabaseService {
  static final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  static final CollectionReference quizCollection =
      FirebaseFirestore.instance.collection("quizzes");

  static final CollectionReference lessonCollection =
      FirebaseFirestore.instance.collection("lessons");

  static final CollectionReference coursesColleciton =
      FirebaseFirestore.instance.collection("courses");

  static Future<List<UserModel>> getAllUsers() async {
    List<UserModel> users = [];
    QuerySnapshot snapshot = await usersCollection.get();

    for (var doc in snapshot.docs) {
      users.add(
          UserModel(doc["uid"], doc["name"], doc["profilePic"], doc["points"]));
    }

    return users;
  }

  static Future<List<Quiz>> getAllQuizzes() async {
    List<Quiz> quizzes = [];
    QuerySnapshot snapshot = await quizCollection.get();

    for (var doc in snapshot.docs) {
      Quiz? quiz = await getQuiz(doc.id);
      quizzes.add(quiz!);
    }

    return quizzes;
  }

  static Future<List<Course>> getAllCourses() async {
    List<Course> courses = [];
    QuerySnapshot snapshot = await coursesColleciton.get();

    for (var doc in snapshot.docs) {
      Course? course = await getCourse(doc.id);
      courses.add(course!);
    }

    return courses;
  }

  static Future<UserModel?> getUser(String id) async {
    UserModel? _user;
    try {
      await usersCollection.doc(id).get().then((DocumentSnapshot snapshot) {
        _user = UserModel(snapshot["uid"], snapshot["name"],
            snapshot["profilePic"], snapshot["points"]);
      });
    } catch (e) {
      // usersCollection.doc(AuthService.user!.uid).set({
      //   "uid": AuthService.user!.uid,
      //   "name": AuthService.user!.name,
      //   "profilePic": AuthService.user!.profilePic,
      //   "points": AuthService.user!.points,
      // });
      return null;
    }

    return _user;
  }

  static Future createUser(
      String uid, String name, String profilePic, int points) async {
    usersCollection.doc(uid).set({
      "uid": uid,
      "name": name,
      "profilePic": profilePic,
      "points": points,
    });
  }

  static Future<void> updateUserPoints(int points) async {
    AuthService.user!.points = points;
    usersCollection.doc(AuthService.user!.uid).update({"points": points});
    AuthService.updateUserFromDatabase();
  }

  static Future<Course?> getCourse(String id) async {
    Course? course;

    await coursesColleciton
        .doc(id)
        .get()
        .then((DocumentSnapshot snapshot) async {
      course = Course(
        snapshot["name"],
        (await getQuiz(snapshot["quizId"]))!,
        (await getLesson(snapshot["lessonId"]))!,
      );
    });

    return course;
  }

  static Future<Quiz?> getQuiz(String id) async {
    Quiz? quiz;

    await quizCollection.doc(id).get().then((DocumentSnapshot snapshot) async {
      quiz = Quiz(await getProblems(id), snapshot["points"]);
    });

    return quiz;
  }

  static Future<List<Problem>> getProblems(String quizId) async {
    List<Problem> problems = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('quizzes/' + quizId + "/problems")
        .get();

    for (var doc in querySnapshot.docs) {
      List<String> options = await getAllProblemOptions(quizId, doc.id);

      problems.add(Problem(doc["body"], options, doc["ans"]));
    }

    return problems;
  }

  static Future<List<String>> getAllProblemOptions(
      String quizId, String problemId) async {
    List<String> options = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('quizzes/' + quizId + "/problems/" + problemId + "/options")
        .get();

    for (var doc in querySnapshot.docs) {
      options.add(doc["name"]);
    }

    return options;
  }

  static Future<Lesson?> getLesson(String id) async {
    Lesson? lesson;

    await lessonCollection
        .doc(id)
        .get()
        .then((DocumentSnapshot snapshot) async {
      lesson = Lesson(["lesson1", "lesson2"]);
    });

    return lesson;
  }

  // static Future<List<Problem>> getLessonPages(String quizId) async {
  //   List<Problem> problems = [];
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('quizzes/' + quizId + "/problems")
  //       .get();

  //   for (var doc in querySnapshot.docs) {
  //     List<String> options = [
  //       "Option 1",
  //       "Option 2",
  //       "option 3",
  //       "option 4",
  //     ];

  //     //add options

  //     problems.add(Problem(doc["body"], options, doc["ans"]));
  //   }

  //   return problems;
  // }
}
