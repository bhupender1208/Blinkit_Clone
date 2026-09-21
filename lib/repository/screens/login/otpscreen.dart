import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../bottomnav/bottomnavscreen.dart';
import '../../widgets/uihelper.dart';

class OtpScreen extends StatefulWidget {
  final String? verificationId;
  final String phoneNumber;
  final int? resendToken;

   final ConfirmationResult? confirmationResult;

  const OtpScreen({
    super.key,
    this.verificationId,
    required this.phoneNumber,
    this.resendToken,
    this.confirmationResult,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  String? _verificationId;
int? _resendToken;

ConfirmationResult? _confirmationResult;

  bool _isVerifying = false;
  bool _isResending = false;

  int _secondsRemaining = 30;
  Timer? _timer; 

 @override
void initState() {
  super.initState();

  _verificationId = widget.verificationId;
  _resendToken = widget.resendToken;
  _confirmationResult = widget.confirmationResult;

  _startResendTimer();
}

  // ============================================================
  // OTP VALIDATION
  // ============================================================

  bool get isValidOtp {
    return RegExp(
      r'^\d{6}$',
    ).hasMatch(_otpController.text.trim());
  }

  // ============================================================
  // RESEND TIMER
  // ============================================================

  void _startResendTimer() {
    _timer?.cancel();

    setState(() {
      _secondsRemaining = 30;
    });

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        if (_secondsRemaining > 0) {
          setState(() {
            _secondsRemaining--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  // ============================================================
  // VERIFY OTP
  // ============================================================

   Future<void> _verifyOtp() async {
  if (!isValidOtp || _isVerifying) return;

  FocusScope.of(context).unfocus();

  setState(() {
    _isVerifying = true;
  });

  final String otp = _otpController.text.trim();

  try {
    // ============================================================
    // WEB / CHROME
    // ============================================================

    if (kIsWeb) {
      if (_confirmationResult == null) {
        throw FirebaseAuthException(
          code: 'missing-confirmation-result',
          message:
              'OTP session not found. Please request OTP again.',
        );
      }

      await _confirmationResult!.confirm(otp);
    }

    // ============================================================
    // ANDROID / NATIVE
    // ============================================================

    else {
      if (_verificationId == null) {
        throw FirebaseAuthException(
          code: 'missing-verification-id',
          message:
              'OTP session not found. Please request OTP again.',
        );
      }

      final PhoneAuthCredential credential =
          PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
    }

    if (!mounted) return;

    setState(() {
      _isVerifying = false;
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const Bottomnavscreen(),
      ),
      (route) => false,
    );
  } on FirebaseAuthException catch (e) {
    if (!mounted) return;

    setState(() {
      _isVerifying = false;
    });

    String message = 'OTP verification failed';

    if (e.code == 'invalid-verification-code') {
      message = 'Incorrect OTP. Please try again.';
    } else if (e.code == 'session-expired') {
      message =
          'OTP has expired. Please request a new OTP.';
    } else if (e.code == 'too-many-requests') {
      message =
          'Too many attempts. Please try again later.';
    } else if (e.message != null) {
      message = e.message!;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  } catch (e) {
    if (!mounted) return;

    setState(() {
      _isVerifying = false;
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
  // RESEND OTP
  // ============================================================

  Future<void> _resendOtp() async {
  if (_secondsRemaining > 0 || _isResending) return;

  FocusScope.of(context).unfocus();

  setState(() {
    _isResending = true;
  });

  try {
    // ============================================================
    // WEB / CHROME RESEND
    // ============================================================

    if (kIsWeb) {
      final ConfirmationResult newConfirmationResult =
          await FirebaseAuth.instance.signInWithPhoneNumber(
        widget.phoneNumber,
      );

      if (!mounted) return;

      setState(() {
        _confirmationResult = newConfirmationResult;
        _isResending = false;
        _otpController.clear();
      });

      _startResendTimer();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'A new OTP has been sent.',
          ),
        ),
      );

      return;
    }

    // ============================================================
    // ANDROID / NATIVE RESEND
    // ============================================================

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      timeout: const Duration(seconds: 60),
      forceResendingToken: _resendToken,

      verificationCompleted:
          (PhoneAuthCredential credential) async {
        try {
          await FirebaseAuth.instance
              .signInWithCredential(credential);

          if (!mounted) return;

          setState(() {
            _isResending = false;
          });

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const Bottomnavscreen(),
            ),
            (route) => false,
          );
        } on FirebaseAuthException catch (e) {
          if (!mounted) return;

          setState(() {
            _isResending = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.message ??
                    'Automatic verification failed',
              ),
            ),
          );
        }
      },

      verificationFailed: (FirebaseAuthException e) {
        if (!mounted) return;

        setState(() {
          _isResending = false;
        });

        String message = 'Unable to resend OTP';

        if (e.code == 'too-many-requests') {
          message =
              'Too many requests. Please try again later.';
        } else if (e.code == 'quota-exceeded') {
          message =
              'SMS quota exceeded. Please try again later.';
        } else if (e.code == 'invalid-phone-number') {
          message = 'Invalid mobile number.';
        } else if (e.message != null) {
          message = e.message!;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      },

      codeSent: (
        String verificationId,
        int? resendToken,
      ) {
        if (!mounted) return;

        setState(() {
          _verificationId = verificationId;
          _resendToken = resendToken;
          _isResending = false;
          _otpController.clear();
        });

        _startResendTimer();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'A new OTP has been sent.',
            ),
          ),
        );
      },

      codeAutoRetrievalTimeout:
          (String verificationId) {
        if (!mounted) return;

        setState(() {
          _verificationId = verificationId;
          _isResending = false;
        });
      },
    );
  } on FirebaseAuthException catch (e) {
    if (!mounted) return;

    setState(() {
      _isResending = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.message ?? 'Unable to resend OTP.',
        ),
      ),
    );
  } catch (e) {
    if (!mounted) return;

    setState(() {
      _isResending = false;
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
  // MASK PHONE NUMBER
  // Example: +918448123458 -> +91 ******3458
  // ============================================================

  String get maskedPhoneNumber {
    final number = widget.phoneNumber;

    if (number.length >= 6) {
      final lastFour =
          number.substring(number.length - 4);

      return '+91 ******$lastFour';
    }

    return number;
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();

    super.dispose();
  }

  // ============================================================
  // MAIN UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final screenWidth =
        MediaQuery.of(context).size.width;

    final isDesktop = screenWidth >= 800;

    final isTablet =
        screenWidth >= 600 &&
        screenWidth < 800;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Uihelper.responsiveWrapper(
          context: context,

          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics:
                    const BouncingScrollPhysics(),

                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        constraints.maxHeight,
                  ),

                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.center,

                      children: [
                        // ========================================
                        // BACK BUTTON
                        // ========================================

                        Align(
                          alignment:
                              Alignment.centerLeft,

                          child: Padding(
                            padding:
                                EdgeInsets.only(
                              left: isDesktop
                                  ? 28
                                  : 8,
                              top: 8,
                            ),

                            child: IconButton(
                              onPressed:
                                  _isVerifying ||
                                          _isResending
                                      ? null
                                      : () {
                                          Navigator.pop(
                                            context,
                                          );
                                        },

                              icon: const Icon(
                                Icons.arrow_back,
                              ),

                              tooltip: 'Back',
                            ),
                          ),
                        ),

                        const Spacer(),

                        // ========================================
                        // BLINKIT LOGO
                        // ========================================

                        Uihelper.CustomImage(
                          img: "blinkit_logo.jpg",
                          height:
                              isDesktop ? 90 : 70,
                          width:
                              isDesktop ? 180 : 140,
                        ),

                        SizedBox(
                          height:
                              isDesktop ? 25 : 20,
                        ),

                        // ========================================
                        // TITLE
                        // ========================================

                        Text(
                          'Verify your mobile number',
                          textAlign:
                              TextAlign.center,

                          style: TextStyle(
                            fontSize:
                                isDesktop
                                    ? 26
                                    : 22,

                            fontWeight:
                                FontWeight.bold,

                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // ========================================
                        // SUBTITLE
                        // ========================================

                        Padding(
                          padding:
                              const EdgeInsets
                                  .symmetric(
                            horizontal: 20,
                          ),

                          child: Text(
                            'Enter the 6-digit OTP sent to\n$maskedPhoneNumber',

                            textAlign:
                                TextAlign.center,

                            style: TextStyle(
                              fontSize:
                                  isDesktop
                                      ? 16
                                      : 14,

                              height: 1.5,

                              color:
                                  Colors.grey.shade600,
                            ),
                          ),
                        ),

                        SizedBox(
                          height:
                              isDesktop ? 30 : 25,
                        ),

                        // ========================================
                        // OTP FIELD
                        // ========================================

                        _buildOtpField(
                          isDesktop,
                          isTablet,
                        ),

                        const SizedBox(height: 14),

                        // ========================================
                        // VERIFY BUTTON
                        // ========================================

                        _buildVerifyButton(
                          isDesktop,
                          isTablet,
                        ),

                        const SizedBox(height: 14),

                        // ========================================
                        // RESEND OTP
                        // ========================================

                        _buildResendSection(
                          isDesktop,
                        ),

                        const Spacer(),

                        // ========================================
                        // SECURITY MESSAGE
                        // ========================================

                        Padding(
                          padding: EdgeInsets.only(
                            left: isDesktop
                                ? 40
                                : 20,
                            right: isDesktop
                                ? 40
                                : 20,
                            bottom: 24,
                          ),

                          child: Text(
                            'For your security, never share your OTP with anyone.',

                            textAlign:
                                TextAlign.center,

                            style: TextStyle(
                              fontSize:
                                  isDesktop
                                      ? 13
                                      : 11,

                              color:
                                  Colors.grey.shade500,
                            ),
                          ),
                        ),
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

  // ============================================================
  // OTP FIELD
  // ============================================================

  Widget _buildOtpField(
    bool isDesktop,
    bool isTablet,
  ) {
    final hPadding =
        isDesktop
            ? 40.0
            : (isTablet ? 24.0 : 16.0);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
      ),

      child: Container(
        height: isDesktop ? 60 : 56,

        decoration: BoxDecoration(
          color: Colors.white,

          border: Border.all(
            color:
                const Color(0XFFD0D0D0),
            width: 1.2,
          ),

          borderRadius:
              BorderRadius.circular(12),
        ),

        child: TextField(
          controller: _otpController,

          enabled:
              !_isVerifying &&
              !_isResending,

          keyboardType:
              TextInputType.number,

          textAlign: TextAlign.center,

          autofillHints: const [
            AutofillHints.oneTimeCode,
          ],

          inputFormatters: [
            FilteringTextInputFormatter
                .digitsOnly,

            LengthLimitingTextInputFormatter(
              6,
            ),
          ],

          style: TextStyle(
            fontSize:
                isDesktop ? 22 : 20,

            fontWeight:
                FontWeight.w600,

            letterSpacing: 8,
          ),

          decoration:
              const InputDecoration(
            hintText: 'Enter OTP',

            border: InputBorder.none,

            contentPadding:
                EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),
          ),

          onChanged: (value) {
            setState(() {});

            // User 6 digits enter kare to
            // keyboard automatically close.
            if (value.length == 6) {
              FocusScope.of(context)
                  .unfocus();
            }
          },

          onSubmitted: (_) {
            if (isValidOtp) {
              _verifyOtp();
            }
          },
        ),
      ),
    );
  }

  // ============================================================
  // VERIFY BUTTON
  // ============================================================

  Widget _buildVerifyButton(
    bool isDesktop,
    bool isTablet,
  ) {
    final hPadding =
        isDesktop
            ? 40.0
            : (isTablet ? 24.0 : 16.0);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
      ),

      child: SizedBox(
        width: double.infinity,

        height:
            isDesktop ? 56 : 50,

        child: ElevatedButton(
          onPressed:
              isValidOtp &&
                      !_isVerifying &&
                      !_isResending
                  ? _verifyOtp
                  : null,

          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color(0XFF0C831F),

            disabledBackgroundColor:
                const Color(0XFFD7D7D7),

            foregroundColor:
                Colors.white,

            elevation: 0,

            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(
                12,
              ),
            ),
          ),

          child: _isVerifying
              ? const SizedBox(
                  height: 22,
                  width: 22,

                  child:
                      CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : Text(
                  'Verify OTP',

                  style: TextStyle(
                    fontSize:
                        isDesktop
                            ? 17
                            : 15,

                    fontWeight:
                        FontWeight.w600,

                    fontFamily:
                        "regular",
                  ),
                ),
        ),
      ),
    );
  }

  // ============================================================
  // RESEND SECTION
  // ============================================================

  Widget _buildResendSection(
    bool isDesktop,
  ) {
    if (_isResending) {
      return Row(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [
          const SizedBox(
            height: 16,
            width: 16,

            child:
                CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),

          const SizedBox(width: 8),

          Text(
            'Resending OTP...',

            style: TextStyle(
              fontSize:
                  isDesktop ? 14 : 13,

              color:
                  Colors.grey.shade600,
            ),
          ),
        ],
      );
    }

    if (_secondsRemaining > 0) {
      return Text(
        'Resend OTP in $_secondsRemaining seconds',

        style: TextStyle(
          fontSize:
              isDesktop ? 14 : 13,

          color:
              Colors.grey.shade600,
        ),
      );
    }

    return TextButton(
      onPressed: _resendOtp,

      child: Text(
        'Resend OTP',

        style: TextStyle(
          fontSize:
              isDesktop ? 15 : 14,

          fontWeight:
              FontWeight.w600,

          color:
              const Color(0XFF0C831F),
        ),
      ),
    );
  }
}