import 'package:flutter/material.dart';
import 'package:food_application/homescreen/home.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Create Account",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Text(
            "Create Account",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Enter your Name, Email and Password for sign up Already have account?",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Full Name"),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                // Outline border style
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                // Border style when focused
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Emaill Address"),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                // Outline border style
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                // Border style when focused
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Password"),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                // Outline border style
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                // Border style when focused
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text("SIGN UP"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 238, 167, 52),
                shadowColor: Colors.black,
                elevation: 5,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Center(
              child: Text(
                "By Signing up you agree to our Terms \n Conditions & Privacy Policy.",
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.facebook),
            onPressed: () {},
            label: Text("CONNECT WITH FACEBOOK"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 57, 89, 152),
              shadowColor: Colors.black,
              elevation: 5,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/OIP.jpeg",
                      height: 25,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    Text("CONNECT WITH GOOGLE")
                  ]),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 66, 113, 244),
                shadowColor: Colors.black,
                elevation: 5,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
        ],
      ),
    );
  }
}
