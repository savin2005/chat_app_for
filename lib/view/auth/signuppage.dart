import 'package:chat_app_for/ViewModel/authservices/authservices.dart';
import 'package:chat_app_for/model/services/utils/appservices.dart';
import 'package:chat_app_for/model/usermodel.dart';
import 'package:chat_app_for/view/auth/loginpage.dart';
import 'package:chat_app_for/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confpasswordController = TextEditingController();
  final Authservices auth = Get.put(Authservices());

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    // You can add validation and API call here
    print('Email: $email');
    print('Password: $password');
    auth.signin(
        email,
        password,
        UserModel(
            status: true,
            lastseen: DateTime.now().millisecondsSinceEpoch,
            email: email,
            profileImage:
                "https://static.vecteezy.com/system/resources/thumbnails/009/734/564/small/default-avatar-profile-icon-of-social-media-user-vector.jpg",
            uid: ""));
    await auth.fetchuser();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomepageScreenView(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.message,
                  size: 80, color: Theme.of(context).colorScheme.primary),
              AppServices.addhight(MediaQuery.of(context).size.height / 30),
              Text(
                "Let's Create, Account For You",
                style: TextStyle(
                    fontSize: 16, color: Theme.of(context).colorScheme.primary),
              ),
              AppServices.addhight(MediaQuery.of(context).size.height / 30),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              AppServices.addhight(MediaQuery.of(context).size.height / 30),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              AppServices.addhight(MediaQuery.of(context).size.height / 30),
              TextField(
                controller: confpasswordController,
                decoration: InputDecoration(
                  labelText: 'Conform Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              AppServices.addhight(MediaQuery.of(context).size.height / 30),
              ElevatedButton(
                onPressed: login,
                child: Text('Sign'),
              ),
              AppServices.addhight(MediaQuery.of(context).size.height / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I Am Member?"),
                  InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          )),
                      child: Text("Login Now"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
