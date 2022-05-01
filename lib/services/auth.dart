import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sparanghel/models/user_model.dart';
import 'package:sparanghel/services/database.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static UserModel? _user;
  static UserModel? get user {
    return _user;
  }

  static Future<UserModel?> _transformInUserModel(User? user) async {
    UserModel? userModel = await DatabaseService.getUser(user!.uid);
    if (userModel == null) {
      DatabaseService.createUser(
          user.uid, user.displayName!, user.photoURL!, 0);
      return user != null
          ? UserModel(user.uid, user.displayName!, user.photoURL!, 0)
          : null;
    } else {
      return user != null
          ? UserModel(
              user.uid, user.displayName!, user.photoURL!, userModel.points)
          : null;
    }

    // if (userModel == null) {
    //   await DatabaseService.createUser(
    //       user.uid, user.displayName!, user.photoURL!, 0);
    // }
  }

  static void updateUserFromDatabase() async {
    _user = await DatabaseService.getUser(AuthService.user!.uid);
  }

  static void updateUserFromDatabaseWithUid(String uid) async {
    _user = await DatabaseService.getUser(uid);
  }

  static Future<dynamic> googleLogIn() async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    _user = await _transformInUserModel(userCredential.user);


    return _user;
  }

  //sign out

  static Future signOut() async {
    _auth.signOut();
    _user = null;
  }
}
