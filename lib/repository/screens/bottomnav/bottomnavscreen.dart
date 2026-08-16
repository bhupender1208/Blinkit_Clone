import 'package:flutter/material.dart';
import '../cart/cartscreen.dart';
import '../category/categoryscreen.dart';
import '../home/homescreen.dart';
import '../print/printscreen.dart';
class Bottomnavscreen extends StatefulWidget {
  const Bottomnavscreen({super.key});

  @override
  State<Bottomnavscreen> createState() => _BottomnavscreenState();
}

class _BottomnavscreenState extends State<Bottomnavscreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homescreen(),
    Cartscreen(),
    Categoryscreen(),
    Printscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;

    return PopScope(
      canPop: _currentIndex == 0, 
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

         if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
         bottomNavigationBar: _buildBottomNavBar(isDesktop),
      ),
    );
  }

  Widget _buildBottomNavBar(bool isDesktop) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 12,
            vertical: 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem("Home", "home_icon.png", 0, isDesktop),
              _buildNavItem("Cart", "cart_icon.png", 1, isDesktop),
              _buildNavItem("Categories", "category_icon.png", 2, isDesktop),
              _buildNavItem("Print", "print_icon.png", 3, isDesktop),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      String label, String icon, int index, bool isDesktop) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: isDesktop ? 28 : 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getNavIcon(index),
              color: isSelected ? const Color(0XFF0C831A) : Colors.black45,
              size: isDesktop ? 26 : 22,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: isDesktop ? 13 : 11,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                color: isSelected ? const Color(0XFF0C831A) : Colors.black45,
                fontFamily: "regular",
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getNavIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_filled;
      case 1:
        return Icons.shopping_cart;
      case 2:
        return Icons.grid_view_rounded;
      case 3:
        return Icons.print;
      default:
        return Icons.circle;
    }
  }
}
