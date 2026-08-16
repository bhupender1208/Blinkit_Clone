import 'package:flutter/material.dart';
import '../bottomnav/bottomnavscreen.dart';
import '../../widgets/uihelper.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;
    final isTablet = screenWidth >= 600 && screenWidth < 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Uihelper.responsiveWrapper(
          context: context,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Uihelper.CustomImage(
                          img: "onboarding.jpg",
                          height: 430,                           
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: isDesktop ? 12 : 1),

                        // ============ BRAND LOGO ============
                        Uihelper.CustomImage(
                          img: "blinkit_logo.jpg",
                          height: isDesktop ? 80 : 65,
                          width: isDesktop ? 160 : 130,
                        ),
                        SizedBox(height: isDesktop ? 12 : 10),

                        // ============ TAGLINE ============
                        Uihelper.CustomText(
                          text: "India's last minute app",
                          color: Colors.black,
                          fontweigt: FontWeight.bold,
                          fontsize: isDesktop ? 18 : 18,
                        ),
                        SizedBox(height: isDesktop ? 2 : 10),                       

                        // ============ LOGIN BUTTON ============
                        _buildLoginButton(context, isDesktop, isTablet),
                        SizedBox(height: isDesktop ? 14 : 10),

                        // ============ PHONE LOGIN ============
                        _buildPhoneLoginOption(isDesktop, isTablet),
                        SizedBox(height: isDesktop ? 20 : 10),

                        // ============ ZOMATO ADDRESS BANNER ============
                        _buildZomatoBanner(isDesktop, isTablet),

                        const Spacer(),  
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  
  Widget _buildLoginButton(
    BuildContext context,
    bool isDesktop,
    bool isTablet,
  ) {
    final hPadding = isDesktop ? 40.0 : (isTablet ? 24.0 : 16.0);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: SizedBox(
        width: double.infinity,
        height: isDesktop ? 56 : 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Bottomnavscreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.CustomImage(
                img: "google.png",
                height: isDesktop ? 24 : 20,
                width: isDesktop ? 24 : 20,
              ),
              const SizedBox(width: 12),
              Text(
                 "Log in or Sign up",
                style: TextStyle(
                  fontSize: isDesktop ? 17 : 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: "regular",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneLoginOption(bool isDesktop, bool isTablet) {
    final hPadding = isDesktop ? 40.0 : (isTablet ? 24.0 : 16.0);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: SizedBox(
        width: double.infinity,
        height: isDesktop ? 56 : 50,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black87,
            side: const BorderSide(color: Color(0XFFD0D0D0), width: 1.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone_android,
                size: isDesktop ? 22 : 18,
                color: Colors.black54,
              ),
              const SizedBox(width: 10),
              Text(
                "Login with Phone Number",
                style: TextStyle(
                  fontSize: isDesktop ? 17 : 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: "regular",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildZomatoBanner(bool isDesktop, bool isTablet) {
    final hPadding = isDesktop ? 40.0 : (isTablet ? 24.0 : 16.0);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0XFFE0E0E0)),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 24 : 16,
          vertical: isDesktop ? 18 : 14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: const Color(0XFFE73837),
              size: isDesktop ? 26 : 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Uihelper.CustomText(
                text: "Access your saved addresses from Zomato automatically!",
                color: Colors.black87,
                fontweigt: FontWeight.w500,
                fontsize: isDesktop ? 14 : 12,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
