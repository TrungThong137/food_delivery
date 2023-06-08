import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FireAuth{
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;

  void signUp(String email, String password, Function onSuccess, Function(String) onError)async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password
      ).then((user){
          print('Success');
          onSuccess();
      });
    }on FirebaseAuthException catch (e) {
      if(e.code=='email-already-in-use'){
        onError('The account already exists for that email.');
         print('The account already exists for that email.');
      }else if(e.code=='weak-password'){
        onError('The password provided is too weak');
        print('The password provided is too weak');
      }
    }catch(e){
      print(e);
    }
  }

  void SignIn(String email, String password, Function onSuccess, Function(String) onError) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password
      ).then((user){
        onSuccess();
      });
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
  }

  void signOut() async{
    print('Sign out');
    return await _firebaseAuth.signOut();
  }

}