import 'package:chat_app_for/ViewModel/authservices/authservices.dart';
import 'package:chat_app_for/model/services/utils/appservices.dart';
import 'package:chat_app_for/view/auth/signuppage.dart';
import 'package:chat_app_for/view/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Authservices auth = Get.put(Authservices());

  void login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      await auth.login(email, password);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomepageScreenView()),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';

      switch (e.code) {
        case 'invalid-email':
          message = "Invalid email format.";
          break;
        case 'user-not-found':
          message = "User not found.";
          break;
        case 'wrong-password':
          message = "Wrong password.";
          break;
        case 'invalid-credential':
          message =
              "Invalid credentials, please check your email and password.";
          break;
        case 'user-disabled':
          message = "This account has been disabled.";
          break;
        case 'too-many-requests':
          message = "Too many attempts. Please try again later.";
          break;
        default:
          message = "Login failed: ${e.message}";
      }

      Get.snackbar("Login Failed", message,
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred: ${e.toString()}",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey, // ✅ Added Form Key
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message,
                      size: 80, color: Theme.of(context).colorScheme.primary),
                  AppServices.addhight(MediaQuery.of(context).size.height / 30),
                  Text(
                    "Welcome Back, you've been missed",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  AppServices.addhight(MediaQuery.of(context).size.height / 30),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!GetUtils.isEmail(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  AppServices.addhight(MediaQuery.of(context).size.height / 30),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  AppServices.addhight(MediaQuery.of(context).size.height / 30),
                  ElevatedButton(
                    onPressed: login,
                    child: Text('Login'),
                  ),
                  AppServices.addhight(MediaQuery.of(context).size.height / 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not A Member?"),
                      InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Signuppage(),
                              )),
                          child: Text("Register Now"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
