import 'package:flutter/material.dart';
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
        colorSchemeSeed: Color(0XFFF7CB45),
        useMaterial3: true,
        fontFamily: "regular",
      ),
      home: Splashscreen(),
    );
  }
}
