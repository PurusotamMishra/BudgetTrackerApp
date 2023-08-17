import 'package:firebase_auth/firebase_auth.dart';
import 'package:budget_tracker/database.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Future signInAnon() async {
  //   try {
  //     AuthResult result = await _firebaseAuth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     return user;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential person = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User per = person.user!;

    await DatabaseService(uid: per.uid).updateUserData('Groceries', -300);
    await DatabaseService(uid: per.uid).updateUserData('Bills', 1000);
    await DatabaseService(uid: per.uid).updateUserData('Salary', 50000);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
