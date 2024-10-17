import 'package:flutter/material.dart';

class Walk2 extends StatefulWidget {
  const Walk2({super.key});

  @override
  State<Walk2> createState() => _Walk2State();
}

class _Walk2State extends State<Walk2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(height: 10),
          Center(
            child: Image.asset(
              "assets/images/Illustrations (1).png",
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
              "Free delivery offers ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: const Text(
              "Free delivery for new customers via Apple Pay and others payment methods.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
