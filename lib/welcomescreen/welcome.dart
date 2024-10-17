import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_application/walkthroughapp/walk1.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _SpalchscreenState();
}

class _SpalchscreenState extends State<WelcomeScreen> {
  @override
  // void initState() {
  //   Future.delayed(const Duration(hours: 80), () {
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => const Walk1()));
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Image.asset(
                "assets/images/g12.png",
                fit: BoxFit.cover,
                height: 80,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Tamang \n FoodService",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black87,
                      ),
                    ]),
              )
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Image.asset(
              "assets/images/illustration.png",
              fit: BoxFit.cover,
              height: 300,
              width: 300,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Welcome It’s a pleasure to meet you. We are excited that you’re here so let’s get started!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            softWrap: true,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Walk1()));
            },
            child: Text('Styled Button'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 238, 167, 52),
              shadowColor: Colors.black,
              elevation: 5,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
