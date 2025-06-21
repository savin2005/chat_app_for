import 'package:chat_app_for/ViewModel/controller/loading.dart';
import 'package:chat_app_for/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authservices extends GetxController {
  RxList userlist = <UserModel>[].obs;
  String userid = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebasestore = FirebaseFirestore.instance;

  void currentuser() {
    User? user11 = _auth.currentUser;
    user11 != null ? userid = user11.uid : "Not";
    print(":::::::::::$userid");
  }

  Future<void> signin(String email, password, UserModel model) async {
    final LoadingController loading = Get.put(LoadingController());
    loading.setLoader(true);
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setBool("Login", true);
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        await adddataforuser(model.toJson(), uid);
        print("user  $uid");
        await fetchuser();
      }
    } catch (e) {
      print(" THIS IS NOT WORKING $e");
    } finally {
      loading.setLoader(false);
    }
  }

  Future<void> adddataforuser(Map<String, dynamic> nn, String id) async {
    try {
      final model = UserModel.fromJson(nn).copywith(uid: id);
      await firebasestore.collection("users").doc(id).set(model.toJson());
      print("user added for chats");
    } catch (e) {
      print("add date for fetech data:::$e");
    }
  }

  Future<void> fetchuser() async {
    try {
      final response = await firebasestore
          .collection("users")
          .where("uid", isNotEqualTo: userid)
          .get();

      var data = response.docs
          .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      userlist.clear();
      userlist.addAll(data);
      print("user fetch successfully");
    } catch (e) {
      print("❌ Error while fetching user: $e");
    }
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    final LoadingController loading = Get.put(LoadingController());
    loading.setLoader(true);

    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setBool("Login", true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("Login Now");
      currentuser();
      await userOnlineStatus();
      await fetchuser();

      print(":::::::::::::::$userid");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print("Wrong password provided.");
      } else {
        print("Login failed: ${e.message}");
      }
    } finally {
      loading.setLoader(false);
    }
  }

  Future<void> logout() async {
    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      sh.setBool("Login", false);
      User? user = _auth.currentUser;
      if (user == null) {
        print("❌ No user logged in");
        return;
      }

      String id = user.uid;

      await FirebaseFirestore.instance.collection("users").doc(id).update({
        "status": false,
        "lastseen": DateTime.now().millisecondsSinceEpoch,
      });
      await _auth.signOut();
    } catch (e) {
      print("::::::::::::::::::::::::::::::::::$e");
    }
  }

  Future<void> useroflineStatus() async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        print("❌ No user logged in");
        return;
      }

      String id = user.uid;

      await FirebaseFirestore.instance.collection("users").doc(id).update({
        "status": false,
        "lastseen": DateTime.now().millisecondsSinceEpoch,
      });

      print("✅ Status Updated Successfully!");
    } catch (e) {
      print("❌ Error Updating Status: $e");
    }
  }

  Future<void> userOnlineStatus() async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        print("❌ No user logged in");
        return;
      }

      String id = user.uid;

      await FirebaseFirestore.instance.collection("users").doc(id).set(
        {
          "status": true,
          "lastseen": DateTime.now().millisecondsSinceEpoch,
        }, // ✅ Safe merge
      );
      print("✅ Status Updated Successfully!");
    } catch (e) {
      print("❌ Error Updating Status: $e");
    }
  }
}
