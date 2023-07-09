import 'package:flutter/material.dart';
import 'package:manageuser/services/auth.dart';

class SignIn extends StatefulWidget {
  //const SignIn({Key? key}) : super(key: key);
  final Function toggleSignInSignUp;
  const SignIn({super.key, required this.toggleSignInSignUp});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Sign in"),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          TextButton.icon(
              icon: const Icon(Icons.person),
              label: const Text("Signup"),
              onPressed: () {
                widget.toggleSignInSignUp();
              }
          )
        ],
      ),
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Color(0xffa48dd3),
                    Color(0xffce71d3),
                    Color(0xffe169be),
                    Color(0xffd76797),
                    Color(0xffde7e8d),
                    Color(0xffe08276),
                  ],
                )
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
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
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            dynamic result = await _authService.signInWithEmailAndPwd(email, password);
                            if (result == null) {
                              var snackBar = const SnackBar(content: Text('signin error'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            else {
                              var snackBar = const SnackBar(content: Text('signin ok'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          }
                        }
                    ),
                  ],
                ),
              ),
            )
            // child: OutlinedButton(
            //   style: OutlinedButton.styleFrom(
            //     primary: Colors.white,
            //     backgroundColor: Colors.teal,
            //     shadowColor: Colors.red,
            //     elevation: 10,
            //   ),
            //   onPressed: () async {
            //     dynamic result = await _authService.signInAnon();
            //     if(result == null) {
            //       print("error");
            //     }else {
            //       print("signed in");
            //       print(result.uid);
            //     }
            //   },
            //   child: const Text('Sign in'),
            // )
        ),
      ),
    );
  }
}
