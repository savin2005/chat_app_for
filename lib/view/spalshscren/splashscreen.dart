import 'dart:async';

import 'package:chat_app_for/ViewModel/authservices/authservices.dart';

import 'package:chat_app_for/view/auth/signuppage.dart';
import 'package:chat_app_for/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Spalshscreen extends StatefulWidget {
  const Spalshscreen({super.key});

  @override
  State<Spalshscreen> createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<Spalshscreen> {
  final Authservices authservices = Get.put(Authservices());
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      checkLoginStatus();
    });
  }

  checkLoginStatus() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    bool isLogin = sh.getBool("Login") ?? false;
    if (isLogin) {
      authservices.currentuser();
      await authservices.fetchuser();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomepageScreenView(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Signuppage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("How Are You")),
    );
  }
}
 