import 'package:chat_app_for/ViewModel/authservices/authservices.dart';
import 'package:chat_app_for/view/auth/loginpage.dart';
import 'package:chat_app_for/view/homepage.dart';
import 'package:chat_app_for/view/seeting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final Authservices authservices = Get.put(Authservices());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Center(
                child: Icon(Icons.message),
              )),
              Padding(
                padding: EdgeInsets.only(left: 24.3),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomepageScreenView(),
                    ));
                  },
                  leading: Icon(Icons.home),
                  title: Text("H O M E"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.3),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SeetingPage(),
                    ));
                  },
                  leading: Icon(Icons.settings),
                  title: Text("S E T T I N G S"),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.3, bottom: 25),
            child: ListTile(
              onTap: () {
                authservices.logout();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
              leading: Icon(Icons.logout),
              title: Text("L O G O U T"),
            ),
          )
        ],
      ),
    );
  }
}
