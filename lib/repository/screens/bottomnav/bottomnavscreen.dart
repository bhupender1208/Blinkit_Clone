import 'package:flutter/material.dart';
import '../account/accountscreen.dart';
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

  // ============================================================
  // BOTTOM NAVIGATION PAGES
  // ============================================================

  final List<Widget> _pages = [
    Homescreen(),
    Cartscreen(),
    Categoryscreen(),
    Printscreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isDesktop = screenWidth >= 800;

    return PopScope(
      // Home tab par ho to normal back behavior.
      // Kisi aur tab par ho to pehle Home par jayega.
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
        // IndexedStack ki wajah se tab switch karne par
        // existing screens ki state preserve rahegi.
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),

        bottomNavigationBar: _buildBottomNavBar(
          isDesktop,
        ),
      ),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION BAR
  // ============================================================

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
            horizontal: isDesktop ? 80 : 4,
            vertical: 6,
          ),

          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,

            children: [
              // ================= HOME =================

              _buildNavItem(
                "Home",
                0,
                isDesktop,
              ),

              // ================= CART =================

              _buildNavItem(
                "Cart",
                1,
                isDesktop,
              ),

              // ============== CATEGORIES ==============

              _buildNavItem(
                "Categories",
                2,
                isDesktop,
              ),

              // ================= PRINT ================

              _buildNavItem(
                "Print",
                3,
                isDesktop,
              ),

              // ================ ACCOUNT ===============

              _buildNavItem(
                "Account",
                4,
                isDesktop,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // INDIVIDUAL NAVIGATION ITEM
  // ============================================================

  Widget _buildNavItem(
    String label,
    int index,
    bool isDesktop,
  ) {
    final isSelected =
        _currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },

        behavior: HitTestBehavior.opaque,

        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: isDesktop ? 20 : 2,
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              // ================= ICON =================

              Icon(
                _getNavIcon(index),

                color: isSelected
                    ? const Color(0XFF0C831A)
                    : Colors.black45,

                size: isDesktop ? 26 : 22,
              ),

              const SizedBox(height: 4),

              // ================= LABEL ================

              Text(
                label,

                maxLines: 1,

                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  fontSize:
                      isDesktop ? 13 : 10,

                  fontWeight: isSelected
                      ? FontWeight.w700
                      : FontWeight.w400,

                  color: isSelected
                      ? const Color(0XFF0C831A)
                      : Colors.black45,

                  fontFamily: "regular",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // NAVIGATION ICONS
  // ============================================================

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

      case 4:
        return Icons.person;

      default:
        return Icons.circle;
    }
  }
}