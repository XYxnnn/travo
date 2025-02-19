import 'package:flutter/material.dart';
import 'package:swe2109567_assignment1/authentication/signup.dart';
import 'package:swe2109567_assignment1/models/users.dart';
import 'package:swe2109567_assignment1/database/sqlite.dart';
import 'package:swe2109567_assignment1/screens/mainpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final username = TextEditingController();
  final password = TextEditingController();

  bool isVisible = false;

  bool isLoginTrue = false;

  final db = DatabaseHelper();

  login() async {
    var response = await db
        .login(Users(usrName: username.text, usrPassword: password.text));
    if (response == true) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    }
    else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                      "Welcome to Travo!",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat'
                      )
                  ),
                  const SizedBox(height: 15),

                  Image.asset(
                    "assets/images/login2.png",
                    width: 250,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff9DCFFF).withOpacity(0.3)),
                    child: TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the email.";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff9DCFFF).withOpacity(0.3)),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the password.";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(
                                  isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off
                              )
                          )
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Login button
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueAccent),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            login();
                          }
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),

                  //Sign up button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
                          child: const Text("Sign Up"))
                    ],
                  ),

                  isLoginTrue
                      ? const Text(
                    "Email or password is incorrect",
                    style: TextStyle(color: Colors.red),
                  )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}