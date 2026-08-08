import 'package:flutter/material.dart';
// import 'package:blinkit_app/repository/screens/splash/splashscreen.dart';

import 'repository/screens/splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blinkit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  Splashscreen()
    );
  }
}

