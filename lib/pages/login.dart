import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sparanghel/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.circle,
              size: 250,
              color: Color(0xFFD3ECA7),
            ),
            const SizedBox(
              height: 75,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                dynamic result = await AuthService.googleLogIn();
                if (result != null) {
                  Navigator.of(context).popAndPushNamed("/main");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Couldn't sign in with google!")));
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12.0),
                primary: const Color(0xFFB33030),
              ),
              icon: const FaIcon(
                FontAwesomeIcons.google,
              ),
              label: const Text(
                "Login with google",
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).popAndPushNamed("/home");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12.0),
                primary: const Color(0xFFB33030),
              ),
              icon: const Icon(
                Icons.email,
              ),
              label: const Text(
                "Login with email",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "You don't have an account? Create one here!",
                style: TextStyle(color: Color(0xFFDEDEDE)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
