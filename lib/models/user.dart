import 'dart:convert';
import 'dart:developer';

import 'package:carpooling/network_utils/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  static var id;
  static var firstname = 'walid';
  static var lastname= 'oualili';
  static var gender= 'male';
  static var birthDate ='2001-01-01';
  static var email= 'walid@gmail.com';
  static var phone= '22787957';
  static var isIDVerified = true;
  static var image= 'images/walidOualili.jpg';
  static var isAuth = false;

  static List _allUsers = [];


  // Load data saved in local;
  Future<void> loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user').toString());
    if(user != null) {
      User.id = user['id'];
      User.firstname = user['firstName'];
      User.lastname = user['lastName'];
      User.birthDate = user['birthDate'];
      User.gender = user['gender'];
      User.email = user['email'];
      User.phone = user['phoneNBR'];
      User.isIDVerified = user['isIDVerified'];
      User.image = user['image'];
      User.isAuth = true;
    }
  }


  // Load all users data;
  Future<void> loadAllUsersData() async {
    var res = await Network().getData('/allUsers');
    var body = json.decode(res.body);
    if(body['success']){
      _allUsers = body['users'];
      // log("Log from loadAllUsersData : $_allUsers");
    }
    else{
      log('Log From loadAllUsersData fetcher: \n\t\t\t * Response Body: $body');
    }
  }


  // Users mapper application;
  Map<String, dynamic> findUserByID(int userID) {
    var index = _allUsers.indexWhere((element) => element['id'] == userID);
    // log('Log from findUserById : index : $index');
    // log('Log from findUserById All Users: $_allUsers');
    return _allUsers[index];
  }



  // Load data from data base;
  void refreshUserData() async {}

}