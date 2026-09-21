import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
 import 'repository/screens/splash/splashscreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
