import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/screens/login.dart';
import 'package:watch_app/screens/signup.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 165,
              width: 147,
              child: Image.asset("assets/images/image.png"),
            ),
          ),
          Text(
            "Welcome To \n Time Travel",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 160,
          ),
          Text(
            'your change starts today!',
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange[800]),
              child: Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already Have an account? ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LogInPage()));
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
