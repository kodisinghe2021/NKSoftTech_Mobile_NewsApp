import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:reading_application_app/utils/util_function.dart';
import 'package:reading_application_app/views/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    naviteToLoginPage();
    super.initState();
  }

  void naviteToLoginPage() {
    Future.delayed(const Duration(seconds: 4), () {
      UtilFunctions.navigateTo(context, LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BounceInDown(
          child: const Text(
            "Proacademy",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          duration: const Duration(milliseconds: 2000),
        ),
      ),
    );
  }
}
