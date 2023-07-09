import 'package:manageuser/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  //const Register({super.key});
  final Function toggleSignInSignUp;
  const Register({super.key, required this.toggleSignInSignUp});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _authService = AuthService();
  final _formRegisterKey = GlobalKey<FormState>();
  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
        title: const Text('Sign up'),
        actions: <Widget>[
          TextButton.icon(
              icon: const Icon(Icons.login_rounded),
              label: const Text("SignIn"),
              onPressed: () {
                widget.toggleSignInSignUp();
              }
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formRegisterKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() => email = value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  setState(() => password = value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shadowColor: Colors.red,
                    elevation: 10,
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formRegisterKey.currentState!.validate()) {
                      _formRegisterKey.currentState!.save();
                      dynamic result = await _authService.registerWithEmailAndPwd(email, password);
                      if (result == null) {
                        var snackBar = const SnackBar(content: Text('signup error'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else {
                        var snackBar = const SnackBar(content: Text('signup ok'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}