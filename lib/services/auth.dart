

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/models/user.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebaseUser
  CurrentUser _userFromFirebase(User user) {
    return user != null ? CurrentUser(uid: user.uid) : null;
  }

  /* auth change stream this is used to dectect when user is logged in or 
   the stream is used to catch the state of the user */
  Stream<CurrentUser> get user {
    return _auth
        .authStateChanges()
        //.map((User user) => _userFromFirebase(user));
        .map(_userFromFirebase);
  }

  // sign in anonimously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      
      // return _userFromFirebase(user);
      return {
        'status': true,
        'message': _userFromFirebase(user)
      };
      
    } catch (e) {
      String message = e.toString();
      print(message);

      return {
        'status': false,
        'message': e.message
      };
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return {
        'status': true,
        'message': _userFromFirebase(user)
      };
    } catch (err) {
      print(err.toString());

       return {
        'status': false,
        'message': err.message
      };
    }
  }

  // sign out
  Future signOut() async {
    try {
     return await _auth.signOut();
    
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
