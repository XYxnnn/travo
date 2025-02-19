import 'package:flutter/material.dart';
import 'package:swe2109567_assignment1/authentication/login.dart';
import 'package:swe2109567_assignment1/models/users.dart';
import 'package:swe2109567_assignment1/database/sqlite.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/signup.png",
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
                          return "Email is required";
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

                  //Password field
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
                          return "Password is required";
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
                                //In here we will create a click to show and hide the password a toggle button
                                setState(() {
                                  //toggle button
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

                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff9DCFFF).withOpacity(0.3)),
                    child: TextFormField(
                      controller: confirmPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        } else if (password.text != confirmPassword.text) {
                          return "Passwords don't match";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Confirmed Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                  ),

                  const SizedBox(height: 10),
                  //Login button
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueAccent),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {

                            final db = DatabaseHelper();
                            db
                                .signup(Users(
                                  usrName: username.text,
                                  usrPassword: password.text))
                                .whenComplete(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const LoginPage()));
                            });
                          }
                        },
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),

                  //Sign up button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Text("Login"))
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