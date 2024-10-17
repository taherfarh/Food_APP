import 'package:flutter/material.dart';

class Walk3 extends StatefulWidget {
  const Walk3({super.key});

  @override
  State<Walk3> createState() => _Walk3State();
}

class _Walk3State extends State<Walk3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(height: 10),
          Center(
            child: Image.asset(
              "assets/images/Illustrations (2).png",
              fit: BoxFit.cover,
              height: 300,
              width: 300,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: const Text(
              "Choose your foods ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: const Text(
              "Easily find your type of food craving and you’ll get delivery in wide range.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),

        ],
      ),
    );
  }
}
