import 'package:flutter/material.dart';
import 'package:manageuser/screens/authentication/register.dart';
import 'package:manageuser/screens/authentication/sign_in.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignIn = false;

  void toggleSignInSignUp() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleSignInSignUp: toggleSignInSignUp);
    } else {
      return Register(toggleSignInSignUp: toggleSignInSignUp);
    }
  }
}
