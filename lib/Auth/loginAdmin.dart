import 'package:competitive_world/Auth/login.dart';
import 'package:flutter/material.dart';

import '../global_variables.dart';
import '../responsive/responsive.dart';
import '../screens/homescreen.dart';
import '../utils/colors.dart';
import '../widgets/curvclippers.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/loading_indicator.dart';

class LoginAdmin extends StatefulWidget {
  static const String routeName = '/LoginAdmin';
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  String ans1 = 'competitveworld1234@gmail.com';
  String ans2 = 'Triangle@123456';
  String result = '';
  String result2 = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      body: Responsive(
        child: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Image(
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  image: AssetImage('assets/study.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.1),
                    TextField(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: buttonColor,
                              width: 2,
                            ),
                          ),
                          labelText: 'Email',
                        ),
                        onSubmitted: (String str) {
                          setState(() {
                            result = str;
                          });
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _passwordController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: buttonColor,
                          width: 2,
                        ),
                      ),
                      labelText: 'Password',
                    ),
                    onSubmitted: (String str) {
                      setState(() {
                        result2 = str;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 70,
                  width: 150,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      if (result == ans1 && result2 == ans2) {
                        isAdmin = true;
                        _emailController.clear();
                        _passwordController.clear();
                        Navigator.pushReplacementNamed(
                            context, HomeScreen.routeName);
                      } else {
                        return null;
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
