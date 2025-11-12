import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_wtf_app/model/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserNotifier extends ChangeNotifier {
  UserDetail? loggedInUser;

  void login(BuildContext context, String email, String password) async {
    try {
      // create user on firebase
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      loggedInUser = UserDetail(
        name: "name",
        profilePicture: "profilePicture",
        email: user.user!.email!,
      );

      // take user to home page
      Navigator.of(context).pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    notifyListeners();
  }

  Future<void> signUp({
    required BuildContext context,
    required String userName,
    required String password,
    required String email,
  }) async {
    try {
      // create user on firebase
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      //Alert user on success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User $userName has been created successfully")),
      );

      // take user to home page
      Navigator.of(context).pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void signInWithGoogle(BuildContext context) async {
    try {
      var instance = GoogleSignIn.instance;
      final GoogleSignInAccount? googleUser = await instance
          .authenticate();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential user = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      print(user);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void forgotPassword(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
