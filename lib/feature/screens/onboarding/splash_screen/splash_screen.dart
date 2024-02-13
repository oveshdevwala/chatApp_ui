import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/app_routes/app_routes.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/constrains/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String navigatorRoute = AppRoutes.phoneNumberScreen;
  @override
  void initState() {
    super.initState();
    getLogin();
  }

  getLogin() async {
    var prefs = await SharedPreferences.getInstance();
    var uId = prefs.getString(LoginPrefKey);
    if (uId != null) {
      if (uId != '') {
        navigatorRoute = AppRoutes.appHomeScreen;
      }
    }
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, navigatorRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Chat App',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: UIColors.black, fontSize: 25),
        ),
      ),
    );
  }
}
