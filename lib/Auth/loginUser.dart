import 'package:competitive_world/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../screens/homescreen.dart';
import '../widgets/curvclippers.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/loading_indicator.dart';
import 'auth_methods.dart';

class LoginUser extends StatefulWidget {
  static const String routeName = '/LoginUser';
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  bool _isLoading = false;
  LoginUser() async {
    setState(() {
      _isLoading = true;
    });
    bool res = await _authMethods.loginUser(
        context, _emailController.text, _passwordController.text);
    setState(() {
      _isLoading = false;
    });
    if (res) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      body: _isLoading
          ? const LoadingIndicator()
          : Responsive(
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
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.1),
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomTextField(
                              controller: _emailController,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomTextField(
                              controller: _passwordController,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(onTap: LoginUser, text: 'Log In'),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
    );
  }
}
