import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/shared/styles/colors.dart';

import '../provider/my_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), SplashNavigator);
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
          backgroundColor:  pro.modeApp == ThemeMode.light
    ?mint
      : Color(0xFF060E1E),
           body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Center(
                   child: Image.asset("assets/images/logo_splash.png",
                   width: 189,
                   height: 211,)),
             ],
           ),

        );
  }

  SplashNavigator() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomeLayout.routeName, (route) => false);
  }
}
