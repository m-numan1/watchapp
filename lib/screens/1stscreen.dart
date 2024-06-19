import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch_app/screens/secondscreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the HomeScreen after 3 seconds
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SecondScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 170,
              ),
              child: Container(
                height: 202,
                width: 180,
                child: Image.asset("assets/images/image.png"),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.black,
            value: 0.8,
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(254, 254, 130, 6)),
          )
        ],
      ),
    );
  }
}
