import 'package:first_wtf_app/data/dummy_user_details.dart';
import 'package:first_wtf_app/model/user_detail.dart';
import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier{
  UserDetail? loggedInUser;


  void login(String email, String password) async{
    Future.delayed(Duration(seconds: 2));

    loggedInUser = USER_DETAILS[0];

    notifyListeners();
  }

  
}