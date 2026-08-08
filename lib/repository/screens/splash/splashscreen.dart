import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:blinkit_app/domain/constants/appcolors.dart';
// import 'package:blinkit_app/repository/screens/login/loginscreen.dart';
// import 'package:blinkit_app/repository/widgets/uihelper.dart';

import '../../../domain/constants/appcolors.dart';
import '../../widgets/uihelper.dart';
import '../login/loginscreen.dart';

class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
     super.initState();
     Timer(Duration(seconds:3),(){
       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Loginscreen()));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.scaffoldbackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(img:"blinkit_logo.jpg")
          ],
        ),
      ),
    );

  }
}