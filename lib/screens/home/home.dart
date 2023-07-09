import 'package:flutter/material.dart';
import 'package:manageuser/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _authService = AuthService();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text("Home page"),
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            onPressed: () async {
              await _authService.signOut();
              print("sign out");
            }
          )
        ],
      ),
    );
  }
}
