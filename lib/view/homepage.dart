import 'package:chat_app_for/ViewModel/authservices/authservices.dart';
import 'package:chat_app_for/view/components/mydrawer.dart';
import 'package:chat_app_for/view/widgets/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageScreenView extends StatefulWidget {
  HomepageScreenView({super.key});

  @override
  State<HomepageScreenView> createState() => _HomepageScreenViewState();
}

class _HomepageScreenViewState extends State<HomepageScreenView>
    with WidgetsBindingObserver {
  final Authservices authservices = Get.put(Authservices());
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print("App State Changed: $state");
    if (state == AppLifecycleState.resumed) {
      String id = await FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection("users").doc(id).update({
        "status": true,
        "lastseen": DateTime.now().millisecondsSinceEpoch,
      });
    } else if (state == AppLifecycleState.paused) {
      String id = await FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection("users").doc(id).update({
        "status": false,
        "lastseen": DateTime.now().millisecondsSinceEpoch,
      });
      print("App is in Background 🌙");
    } else if (state == AppLifecycleState.inactive) {
      print("App is Inactive 🚧");
    } else if (state == AppLifecycleState.detached) {
      print("App is Detached ❌");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: authservices.userlist.length,
                itemBuilder: (context, index) {
                  var data = authservices.userlist[index];
                  return Homescreen(data: data);
                },
              ),
            )
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
