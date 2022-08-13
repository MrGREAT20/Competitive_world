import 'package:competitive_world/Auth/login.dart';
import 'package:competitive_world/Auth/loginAdmin.dart';
import 'package:competitive_world/Auth/loginUser.dart';
import 'package:competitive_world/Auth/register.dart';
import 'package:competitive_world/providers/user_provider.dart';
import 'package:competitive_world/screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:competitive_world/Auth/login.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Login.routeName: (context) => const Login(),
        LoginUser.routeName: (context) => const LoginUser(),
        LoginAdmin.routeName: (context) => const LoginAdmin(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        Register.routeName: (context) => const Register()
      },
      home: Login(),
    );
  }
}
