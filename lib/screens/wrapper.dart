import 'package:flutter/material.dart';
import 'package:manageuser/screens/authentication/authentication.dart';
import 'package:manageuser/models/user.dart' as UserModal;
import 'package:manageuser/screens/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModal.User?>(context);

    if (user == null) {
      return Authentication();
    }
    else {
      return Home();
    }
  }
}
