import 'package:competitive_world/Auth/register.dart';
import 'package:competitive_world/widgets/curvclippers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../services/globalmethods.dart';
import 'loginAdmin.dart';
import 'loginUser.dart';

class Login extends StatefulWidget {
  static const routeName = '/onboarding';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginAdmin()));
                },
                icon: Image.asset(
                  'assets/teacher.png',
                  height: 50,
                  fit: BoxFit.contain,
                ),
                label: Text('Login as Teacher',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size.fromHeight(100)),
                    elevation: MaterialStateProperty.all(16.0),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 70, vertical: 20)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red.shade100)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginUser()));
                },
                icon: Image.asset(
                  'assets/reading.png',
                  height: 50,
                  fit: BoxFit.contain,
                ),
                label: Text('Login as Student',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size.fromHeight(100)),
                    elevation: MaterialStateProperty.all(16.0),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 70, vertical: 20)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red.shade100)),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Don\'t have an Account?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                TextSpan(
                  text: '   ',
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, Register.routeName);
                    },
                  text: 'Register here',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              ])),
            )
          ],
        ),
      )),
    );
  }
}
