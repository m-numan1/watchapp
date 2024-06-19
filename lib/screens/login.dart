import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/screens/workoutscree.dart/homewrkout.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool show = true;
  bool toggle() {
    if (show == true) {
      setState(() {
        show = false;
      });
    } else {
      setState(() {
        show = true;
      });
    }

    return show;
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  void sigin() async {
    try {
      final user = await auth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then(
        (value) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomeWorkOut()));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('LogIn Successfully')),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * .07, vertical: screenHeight * .07),
              child: Form(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          //       (
                          // CupertinoPageRoute(builder: (context) => SecondScreen()),
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * .02, bottom: screenWidth * .04),
                      child: const Text(
                        "LogIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const Text(
                      "Enter your information below or sign up \n with Apple ID or Gmail",
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * .07,
                      ),
                      child: CupertinoTextField(
                          prefix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.email,
                              color: Colors.orange,
                            ),
                          ),
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          placeholder: 'Enter your email',
                          placeholderStyle: const TextStyle(
                              color: CupertinoColors.systemOrange),
                          padding: const EdgeInsets.all(16),
                          style: const TextStyle(color: CupertinoColors.black),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: CupertinoColors.inactiveGray,
                              width: 1.0,
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * .03,
                      ),
                      child: CupertinoTextField(
                          prefix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.lock,
                              color: Colors.orange,
                            ),
                          ),
                          controller: password,
                          obscureText: show,
                          suffix: IconButton(
                            onPressed: () {
                              toggle();
                            },
                            icon: const Icon(Icons.remove_red_eye_outlined),
                            color: Colors.orange,
                          ),
                          placeholder: 'Enter password',
                          placeholderStyle: const TextStyle(
                              color: CupertinoColors.systemOrange),
                          padding: const EdgeInsets.all(16),
                          style: const TextStyle(color: CupertinoColors.black),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: CupertinoColors.inactiveGray,
                              width: 1.0,
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * .09),
                      child: GestureDetector(
                        onTap: () {
                          sigin();
                        },
                        child: Container(
                          height: screenHeight * .08,
                          width: screenWidth * .8,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * .08, left: screenWidth * .05),
                      child: const Center(
                        child: Text(
                          "Or Login with",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * .05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: screenHeight * .06,
                              width: screenWidth * .06,
                              child: Image.asset('assets/images/google.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: screenHeight * .06,
                                width: screenWidth * .06,
                                child: Image.asset(
                                  'assets/images/apple.png',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
