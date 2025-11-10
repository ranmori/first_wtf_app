import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_wtf_app/data/dummy_user_details.dart';
import 'package:first_wtf_app/model/user_detail.dart';
import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier {
  UserDetail? loggedInUser;

  void login(BuildContext context, String email, String password) async {
    print("Got in to log in function");
    // You can do more like validate if it is a valid
    //
    //
    Future.delayed(Duration(seconds: 2));

    for (var userDetail in USER_DETAILS) {
      if (userDetail.email == email && userDetail.password == password) {
        loggedInUser = userDetail;
        Navigator.of(context).pushReplacementNamed("/home");
      } else {
        // notfy user using
      }
    }

    // var usersFound = USER_DETAILS.where((userDetail){
    //   return userDetail.email == email && userDetail.password == password;
    // });

    // if(usersFound.isEmpty){
    //   //notify user
    // }else{
    //   loggedInUser = userDetail;
    //     Navigator.of(context).pushReplacementNamed("/home");
    // }

    notifyListeners();
  }

  Future<void> signUp({
    required BuildContext context,
    required String userName,
    required String password,
    required String email,
  })async {
    UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User $userName has been created successfully")));
  }
}
