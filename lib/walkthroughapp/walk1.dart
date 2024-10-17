import 'package:flutter/material.dart';
import 'package:food_application/loginscreen/login.dart';
import 'package:food_application/walkthroughapp/walk2.dart';
import 'package:food_application/walkthroughapp/walk3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Walk1 extends StatefulWidget {
  const Walk1({super.key});

  @override
  State<Walk1> createState() => _Walk1State();
}

class _Walk1State extends State<Walk1> {
  final PageController controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),
          Row(
            children: [
              SizedBox(width: 30),
              Image.asset(
                "assets/images/g12.png",
                fit: BoxFit.cover,
                height: 80,
              ),
              SizedBox(width: 30),
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
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                // Replace with your actual screens
                Walk1Screen(), // Your Walk1 screen
                Walk2(), // Your Walk2 screen
                Walk3(), // Your Walk3 screen
              ],
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: controller,
            count: 3, // Total number of pages
            effect: WormEffect(
              spacing: 8.0,
              radius: 4.0,
              dotWidth: 15.0,
              dotHeight: 5.0,
              paintStyle: PaintingStyle.stroke,
              strokeWidth: 1.5,
              dotColor: Colors.grey,
              activeDotColor: const Color.fromARGB(255, 34, 164, 93),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (currentPage < 2) {
                // Move to the next page
                controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                // Navigate to the next screen after the last page
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginSccreen()),
                );
              }
            },
            child: Text(currentPage < 2 ? 'Next' : 'Get Started'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 238, 167, 52),
              shadowColor: Colors.black,
              elevation: 5,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Walk1Screen extends StatelessWidget {
  const Walk1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Illustration (1).png", // Replace with your image
            fit: BoxFit.cover,
            height: 300,
            width: 300,
          ),
          const SizedBox(height: 15),
          const Text(
            "Welcome to Tamang FoodService",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text(
            "Order from the best local restaurants with easy, on-demand delivery.",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
