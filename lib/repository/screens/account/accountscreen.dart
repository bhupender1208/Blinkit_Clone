import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';
import '../login/loginscreen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isLoggingOut = false;

  // ============================================================
  // LOGOUT CONFIRMATION
  // ============================================================

  Future<void> _showLogoutDialog() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      barrierDismissible: !_isLoggingOut,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Logout',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Are you sure you want to logout?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      await _logout();
    }
  }

  // ============================================================
  // FIREBASE LOGOUT
  // ============================================================

  Future<void> _logout() async {
    if (_isLoggingOut) return;

    setState(() {
      _isLoggingOut = true;
    });

    try {
      await FirebaseAuth.instance.signOut();

      if (!mounted) return;

      // Remove all previous authenticated screens.
      // User back button se Home par wapas nahi ja payega.
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const Loginscreen(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoggingOut = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message ??
                'Unable to logout. Please try again.',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoggingOut = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something went wrong. Please try again.',
          ),
        ),
      );
    }
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isDesktop = screenWidth >= 800;
    final isTablet =
        screenWidth >= 600 && screenWidth < 800;

    final horizontalPadding = isDesktop
        ? 40.0
        : (isTablet ? 24.0 : 16.0);

    final User? user =
        FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0XFFF5F5F5),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(
          'My Account',
          style: TextStyle(
            color: Colors.black,
            fontSize: isDesktop ? 22 : 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: Uihelper.responsiveWrapper(
          context: context,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: isDesktop ? 30 : 20,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: [
                // =================================================
                // PROFILE CARD
                // =================================================

                Container(
                  padding: EdgeInsets.all(
                    isDesktop ? 24 : 18,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      // Profile Icon
                      Container(
                        height: isDesktop ? 70 : 60,
                        width: isDesktop ? 70 : 60,
                        decoration: const BoxDecoration(
                          color: Color(0XFFE8F5E9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: isDesktop ? 38 : 32,
                          color:
                              const Color(0XFF0C831F),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Blinkit User',
                              style: TextStyle(
                                fontSize:
                                    isDesktop ? 20 : 17,
                                fontWeight:
                                    FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              user?.phoneNumber ??
                                  'Phone number unavailable',
                              style: TextStyle(
                                fontSize:
                                    isDesktop ? 15 : 13,
                                color:
                                    Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: isDesktop ? 30 : 20,
                ),

                // =================================================
                // ACCOUNT SECTION TITLE
                // =================================================

                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: isDesktop ? 17 : 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 10),

                // =================================================
                // ACCOUNT OPTIONS
                // =================================================

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _buildOption(
                        icon: Icons.person_outline,
                        title: 'Profile',
                        isDesktop: isDesktop,
                        onTap: () {
                         },
                      ),

                      _divider(),

                      _buildOption(
                        icon:
                            Icons.location_on_outlined,
                        title: 'Saved Addresses',
                        isDesktop: isDesktop,
                        onTap: () {
                         },
                      ),

                      _divider(),

                      _buildOption(
                        icon:
                            Icons.shopping_bag_outlined,
                        title: 'My Orders',
                        isDesktop: isDesktop,
                        onTap: () {
                         },
                      ),

                      _divider(),

                      _buildOption(
                        icon:
                            Icons.help_outline,
                        title: 'Help & Support',
                        isDesktop: isDesktop,
                        onTap: () {
                         },
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: isDesktop ? 30 : 24,
                ),

                // =================================================
                // LOGOUT BUTTON
                // =================================================

                SizedBox(
                  width: double.infinity,
                  height: isDesktop ? 56 : 50,
                  child: OutlinedButton.icon(
                    onPressed: _isLoggingOut
                        ? null
                        : _showLogoutDialog,

                    icon: _isLoggingOut
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child:
                                CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.red,
                            ),
                          )
                        : const Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),

                    label: Text(
                      _isLoggingOut
                          ? 'Logging out...'
                          : 'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize:
                            isDesktop ? 17 : 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.red,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // =================================================
                // APP INFO
                // =================================================

                Text(
                  'Blinkit Clone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ACCOUNT OPTION
  // ============================================================

  Widget _buildOption({
    required IconData icon,
    required String title,
    required bool isDesktop,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 22 : 16,
          vertical: isDesktop ? 18 : 15,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: isDesktop ? 26 : 23,
              color: Colors.black87,
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isDesktop ? 16 : 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              size: isDesktop ? 17 : 14,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DIVIDER
  // ============================================================

  Widget _divider() {
    return Divider(
      height: 1,
      thickness: 0.7,
      indent: 55,
      color: Colors.grey.shade200,
    );
  }
}