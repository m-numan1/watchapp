
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/screens/login.dart';


class SignUpPage extends StatefulWidget {
 const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();

  TextEditingController mobile = TextEditingController();

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
  //CollectionReference users = FirebaseFirestore.instance.collection('User');
  CollectionReference users = FirebaseFirestore.instance.collection('User');
  Future<void> signup() async {
    try {
      final auths = await auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then(
        (value) {
          Map<String, dynamic> data = {
            'email': email.text.trim(),
            'mobile': password.text.trim(),
          };
          users.add(data);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>const LogInPage()));
        },
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString() )),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    mobile.dispose();
    password.dispose();
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
              padding:
                   EdgeInsets.symmetric(horizontal: screenWidth*.07, vertical: screenHeight*07),
              child: Form(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
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
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const Text(
                      "Enter your information below or sign up\nwith Apple ID or Gmail",
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * .04,
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
                        top: screenHeight * .04,
                      ),
                      child: CupertinoTextField(
                          prefix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.system_security_update_good_rounded,
                              color: Colors.orange,
                            ),
                          ),
                          controller: mobile,
                          keyboardType: TextInputType.number,
                          placeholder: 'Enter your mobile number',
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
                        top: screenHeight * .04,
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
                          placeholder: 'Create password',
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
                      padding: EdgeInsets.only(top: screenHeight * .04),
                      child: GestureDetector(
                        onTap: () {
                          signup();
                        },
                        child: Container(
                          height: screenHeight * .08,
                          width: screenWidth * 7,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                color: Colors.white70,
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
                          top: screenHeight * .04, left: screenWidth * .02),
                      child: const Center(
                        child: Text(
                          "Or Register with",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * .02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight * .1,
                            width: screenWidth * .1,
                            child: Image.asset('assets/images/google.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: screenHeight * .1,
                              width: screenWidth * .1,
                              child: Image.asset(
                                'assets/images/apple.png',
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * .04, top: screenHeight * .03),
                      child: Row(
                        children: [
                          Text(
                            'Already Have an Account?',
                            style: TextStyle(color: Colors.white70),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LogInPage()));
                            },
                            child: Text(
                              'LogIn',
                              style: TextStyle(color: Colors.orange),
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
