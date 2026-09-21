import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../domain/constants/appcolors.dart';
import '../../widgets/uihelper.dart';
import '../bottomnav/bottomnavscreen.dart';
import '../login/loginscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
       if (!mounted) return;

       final User? user = FirebaseAuth.instance.currentUser;

       final Widget nextScreen = user != null
          ? const Bottomnavscreen()
          : const Loginscreen();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;

    return Scaffold(
      backgroundColor: Appcolors.scaffoldbackground,
      body: Center(
        child: Uihelper.responsiveWrapper(
          context: context,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ============ LOGO ============
              Uihelper.CustomImage(
                img: "blinkit_logo.jpg",
                height: isDesktop ? 620 : 500,
                width: isDesktop ? 340 : 300,
              ),

              // ============ LOADING INDICATOR ============
              SizedBox(
                height: isDesktop ? 32 : 24,
                width: isDesktop ? 32 : 24,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0XFF0C831A),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}