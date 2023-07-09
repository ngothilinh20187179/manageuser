import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manageuser/screens/wrapper.dart';
import 'package:manageuser/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:manageuser/models/user.dart' as UserModal;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModal.User?>.value(
      value: AuthService().user,
      initialData: null,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
    // return const MaterialApp(
    //     home: Wrapper(),
    // );
  }
}


