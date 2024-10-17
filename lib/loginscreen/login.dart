import 'package:flutter/material.dart';
import 'package:food_application/createaccount/create_account.dart';
import 'package:food_application/homescreen/home.dart';

class LoginSccreen extends StatefulWidget {
  const LoginSccreen({super.key});

  @override
  State<LoginSccreen> createState() => _LoginSccreenState();
}

class _LoginSccreenState extends State<LoginSccreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Sign In",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Text(
            "Welcome To Tammang \n Food Service",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Enter your Phone number or Email address for sign in. Enjoy your food :)",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Email Address"),
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
          Center(
            child: Text("Forget Password?"),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text("SIGN IN"),
              style: ElevatedButton.styleFrom(
                foregroundColor: 
                Colors.white,
                backgroundColor: const Color.fromARGB(255, 238, 167, 52),
                shadowColor: Colors.black,
                elevation: 5,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Don't have account"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateAccountScreen()));
                  },
                  child: Text(
                    "Create new account",
                    style: TextStyle(color: Color.fromARGB(255, 238, 167, 52)),
                  )),
            ],
          ),
          Center(
            child: Text("Or"),
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
