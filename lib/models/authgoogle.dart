import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_food_delivery/models/GoogleAuth.dart';
String email, name, photoUrl;

class User{
  final String email;
  User({this.email});
}

class Authentication with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  AuthGG  _currentAuth;
  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(email: user.email) : null;
  }

  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future registerwithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future signOutFromFirebase() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future signInWithGoogle() async {
      try{
          final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

          final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.getCredential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken);

          final AuthResult result =
          await _firebaseAuth.signInWithCredential(credential);
          final FirebaseUser user = result.user;

          assert(user.displayName != null);
          assert(user.email != null);
          assert(user.photoUrl != null);

          name = user.displayName;
          email = user.email;
          photoUrl = user.photoUrl;

          assert(!user.isAnonymous );
          assert(  user.getIdToken != null);

          final FirebaseUser currentUser = await _firebaseAuth.currentUser();
          assert(user.uid == currentUser.uid);

          print('ss $email');
          return email;

          } catch (e) {
           print('error $email');
           return null;
           }


        }

      Future signOutOfGoogle() async {
        await googleSignIn.signOut();
        await _firebaseAuth.signOut();
        print ('Sign Out succeeded: $email');
       }
        AuthGG get currentAuth => _currentAuth;
       set currentFood(AuthGG authGG) {
          _currentAuth = authGG;
         notifyListeners();
  }

  }
