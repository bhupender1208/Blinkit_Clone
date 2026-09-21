import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../bottomnav/bottomnavscreen.dart';
import '../../widgets/uihelper.dart';
import 'package:weather_app/repository/screens/login/otpscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _phoneController = TextEditingController();

  // Firebase test credentials for portfolio demo
  static const String _demoPhoneNumber = '9876543210';
  static const String _demoOtp = '123456';

  bool _isLoading = false;
  bool _showPhoneInput = false;

  // ============================================================
  // PHONE NUMBER VALIDATION
  // ============================================================

  bool get isValidNumber {
    return RegExp(r'^[6-9]\d{9}$').hasMatch(_phoneController.text.trim());
  }

  // ============================================================
  // SEND OTP
  // ============================================================

  Future<void> _sendOtp() async {
    if (!isValidNumber || _isLoading) return;

    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
    });

    final String phoneNumber = '+91${_phoneController.text.trim()}';

    try {
      // ============================================================
      // WEB / CHROME
      // ============================================================

      if (kIsWeb) {
        final ConfirmationResult confirmationResult = await FirebaseAuth
            .instance
            .signInWithPhoneNumber(phoneNumber);

        if (!mounted) return;

        setState(() {
          _isLoading = false;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OtpScreen(
              phoneNumber: phoneNumber,
              confirmationResult: confirmationResult,
            ),
          ),
        );

        return;
      }

      // ============================================================
      // ANDROID / NATIVE
      // ============================================================

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),

        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await FirebaseAuth.instance.signInWithCredential(credential);

            if (!mounted) return;

            setState(() {
              _isLoading = false;
            });

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const Bottomnavscreen()),
              (route) => false,
            );
          } on FirebaseAuthException catch (e) {
            if (!mounted) return;

            setState(() {
              _isLoading = false;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message ?? 'Automatic verification failed'),
              ),
            );
          }
        },

        verificationFailed: (FirebaseAuthException e) {
          if (!mounted) return;

          setState(() {
            _isLoading = false;
          });

          String message = 'OTP send nahi ho paya';

          if (e.code == 'invalid-phone-number') {
            message = 'Please enter a valid mobile number';
          } else if (e.code == 'too-many-requests') {
            message = 'Too many attempts. Please try again later.';
          } else if (e.code == 'quota-exceeded') {
            message = 'SMS quota exceeded. Please try again later.';
          } else if (e.message != null) {
            message = e.message!;
          }

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        },

        codeSent: (String verificationId, int? resendToken) {
          if (!mounted) return;

          setState(() {
            _isLoading = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OtpScreen(
                verificationId: verificationId,
                phoneNumber: phoneNumber,
                resendToken: resendToken,
              ),
            ),
          );
        },

        codeAutoRetrievalTimeout: (String verificationId) {
          if (!mounted) return;

          setState(() {
            _isLoading = false;
          });
        },
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      String message = 'Something went wrong';

      if (e.code == 'invalid-phone-number') {
        message = 'Please enter a valid mobile number';
      } else if (e.code == 'too-many-requests') {
        message = 'Too many attempts. Please try again later.';
      } else if (e.code == 'quota-exceeded') {
        message = 'SMS quota exceeded. Please try again later.';
      } else if (e.message != null) {
        message = e.message!;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong. Please try again.'),
        ),
      );
    }
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  // ============================================================
  // MAIN UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isDesktop = screenWidth >= 800;
    final isTablet = screenWidth >= 600 && screenWidth < 800;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

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
                        // ========================================
                        // ONBOARDING IMAGE
                        // ========================================
                        Uihelper.CustomImage(
                          img: "onboarding.jpg",
                          height: 430,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),

                        SizedBox(height: isDesktop ? 12 : 1),

                        // ========================================
                        // BLINKIT LOGO
                        // ========================================
                        Uihelper.CustomImage(
                          img: "blinkit_logo.jpg",
                          height: isDesktop ? 80 : 65,
                          width: isDesktop ? 160 : 130,
                        ),

                        SizedBox(height: isDesktop ? 12 : 10),

                        // ========================================
                        // TAGLINE
                        // ========================================
                        Uihelper.CustomText(
                          text: "India's last minute app",
                          color: Colors.black,
                          fontweigt: FontWeight.bold,
                          fontsize: 18,
                        ),

                        SizedBox(height: isDesktop ? 2 : 10),

                        // ========================================
                        // EXISTING LOGIN BUTTON
                        // UI SAME AS BEFORE
                        // ========================================
                        _buildLoginButton(context, isDesktop, isTablet),

                        SizedBox(height: isDesktop ? 14 : 10),

                        // ========================================
                        // PHONE LOGIN
                        // ========================================
                        if (!_showPhoneInput)
                          _buildPhoneLoginOption(isDesktop, isTablet)
                        else
                          _buildPhoneNumberSection(isDesktop, isTablet),

                        SizedBox(height: isDesktop ? 20 : 10),

                        // ========================================
                        // ZOMATO BANNER
                        // ========================================
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40.0 : (isTablet ? 24.0 : 16.0),
      ),
      child: Center(
        child: Text(
          "Log in or Sign up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isDesktop ? 17 : 13,
            fontWeight: FontWeight.w600,
            fontFamily: "regular",
            color: Colors.black45,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PHONE LOGIN BUTTON
  // ============================================================

  Widget _buildPhoneLoginOption(bool isDesktop, bool isTablet) {
    final hPadding = isDesktop ? 40.0 : (isTablet ? 24.0 : 16.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),

      child: SizedBox(
        width: double.infinity,
        height: isDesktop ? 56 : 50,

        child: OutlinedButton(
          // NEW:
          // Button click karne par phone field show hogi.
          onPressed: () {
            setState(() {
              _showPhoneInput = true;
            });
          },

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

  // ============================================================
  // PHONE NUMBER INPUT + CONTINUE BUTTON
  // ============================================================

  Widget _buildPhoneNumberSection(bool isDesktop, bool isTablet) {
    final hPadding = isDesktop ? 40.0 : (isTablet ? 24.0 : 16.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),

      child: Column(
        children: [
          // ========================================
          // PHONE NUMBER FIELD
          // ========================================
          Container(
            height: isDesktop ? 58 : 54,

            decoration: BoxDecoration(
              color: Colors.white,

              border: Border.all(color: const Color(0XFFD0D0D0), width: 1.2),

              borderRadius: BorderRadius.circular(12),
            ),

            child: Row(
              children: [
                // ==================================
                // COUNTRY CODE
                // ==================================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),

                  child: Row(
                    children: [
                      Text(
                        '🇮🇳',
                        style: TextStyle(fontSize: isDesktop ? 20 : 18),
                      ),

                      const SizedBox(width: 6),

                      Text(
                        '+91',
                        style: TextStyle(
                          fontSize: isDesktop ? 17 : 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(width: 1, height: 28, color: const Color(0XFFD0D0D0)),

                // ==================================
                // NUMBER
                // ==================================
                Expanded(
                  child: TextField(
                    controller: _phoneController,

                    keyboardType: TextInputType.phone,

                    autofillHints: const [AutofillHints.telephoneNumber],

                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,

                      LengthLimitingTextInputFormatter(10),
                    ],

                    style: TextStyle(
                      fontSize: isDesktop ? 17 : 15,
                      fontWeight: FontWeight.w500,
                    ),

                    decoration: const InputDecoration(
                      hintText: 'Enter mobile number',

                      border: InputBorder.none,

                      contentPadding: EdgeInsets.symmetric(horizontal: 14),
                    ),

                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // ========================================
          // DEMO LOGIN CARD
          // ========================================
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isDesktop ? 16 : 13),
            decoration: BoxDecoration(
              color: const Color(0XFFF7FFF8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0XFF0C831F).withOpacity(0.25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.science_outlined,
                      color: const Color(0XFF0C831F),
                      size: isDesktop ? 21 : 18,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      'Demo Login',
                      style: TextStyle(
                        fontSize: isDesktop ? 15 : 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  'Recruiter/Demo Acess',
                  style: TextStyle(
                    fontSize: isDesktop ? 13 : 11,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Phone: $_demoPhoneNumber',
                        style: TextStyle(
                          fontSize: isDesktop ? 14 : 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    Text(
                      'OTP: $_demoOtp',
                      style: TextStyle(
                        fontSize: isDesktop ? 14 : 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  height: isDesktop ? 42 : 38,
                  child: OutlinedButton.icon(
                    onPressed: _isLoading
                        ? null
                        : () {
                            _phoneController.text = _demoPhoneNumber;

                            setState(() {});

                            FocusScope.of(context).unfocus();
                          },

                    icon: const Icon(Icons.auto_fix_high, size: 17),

                    label: const Text(
                      'Use Demo Number & OTP For Login',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),

                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0XFF0C831F),

                      side: const BorderSide(color: Color(0XFF0C831F)),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // ========================================
          // CONTINUE / SEND OTP BUTTON
          // ========================================
          SizedBox(
            width: double.infinity,
            height: isDesktop ? 56 : 50,

            child: ElevatedButton(
              onPressed: isValidNumber && !_isLoading ? _sendOtp : null,

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF0C831F),

                disabledBackgroundColor: const Color(0XFFD7D7D7),

                foregroundColor: Colors.white,

                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              child: _isLoading
                  ? const SizedBox(
                      height: 22,
                      width: 22,

                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: isDesktop ? 17 : 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: "regular",
                      ),
                    ),
            ),
          ),

          const SizedBox(height: 8),

          // ========================================
          // BACK OPTION
          // ========================================
        ],
      ),
    );
  }

  // ============================================================
  // ZOMATO ADDRESS BANNER
  // ============================================================

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
