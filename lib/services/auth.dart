import 'package:firebase_auth/firebase_auth.dart';
import 'package:manageuser/models/user.dart' as UserModal;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on Firebase User
  _userFromFirebaseUser(User? user) {
    return user != null ? UserModal.User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<UserModal.User?> get user => _auth.authStateChanges().map(
        (User? firebaseUser) => (firebaseUser != null) ? _userFromFirebaseUser(firebaseUser) : null,
  );

  // sign in
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPwd(String email, String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPwd(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }catch(e) {
      print(e.toString());
      return null;
    }
  }
}