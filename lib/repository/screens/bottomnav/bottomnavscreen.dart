import 'package:flutter/material.dart';
// import 'package:blinkit_app/repository/screens/category/categoryscreen.dart';
// import 'package:blinkit_app/repository/screens/cart/cartscreen.dart';
// import 'package:blinkit_app/repository/screens/home/homescreen.dart';
// import 'package:blinkit_app/repository/screens/print/printscreen.dart';
// import 'package:blinkit_app/repository/widgets/uihelper.dart';

import '../../widgets/uihelper.dart';
import '../cart/cartscreen.dart';
import '../category/categoryscreen.dart';
import '../home/homescreen.dart';
import '../print/printscreen.dart';

class Bottomnavscreen extends StatefulWidget {
  @override
  State<Bottomnavscreen> createState() => _BottomnavscreenState();
}

class _BottomnavscreenState extends State<Bottomnavscreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    Homescreen(),
    Cartscreen(),
    Categoryscreen(),
    Printscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // PopScope back button click ko capture karta hai
    return PopScope(
      canPop: currentIndex == 0, // Agar Home screen (index 0) par hain toh hi exit allow karega
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return; // Agar pehle hi pop ho chuka hai toh kuch mat karo

        // Agar user kisi aur screen par hai, toh back karne pe pehle Home (index 0) par bhejega
        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Uihelper.CustomImage(img: "home 1.png"),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Uihelper.CustomImage(img: "shopping-bag 1.png"),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Uihelper.CustomImage(img: "category 1.png"),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Uihelper.CustomImage(img: "printer 1.png"),
              label: "Print",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

