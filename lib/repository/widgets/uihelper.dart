import 'package:flutter/material.dart';

class Uihelper {
  // ==================== CUSTOM IMAGE ====================
  static CustomImage({
    required String img,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return Image.asset(
      "assets/images/$img",
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
    );
  }

  // ==================== CUSTOM TEXT ====================
  static CustomText({
    required String text,
    required Color color,
    required FontWeight fontweigt,
    String? fontfamily,
    required double fontsize,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontfamily ?? "regular",
        fontWeight: fontweigt,
        color: color,
      ),
    );
  }

  // ==================== CUSTOM TEXT FIELD (RESPONSIVE — FIXED) ====================
   
  static CustomTextField({
    required TextEditingController controller,
    String? hintText,
    TextInputType? keyboardType,
  }) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Color(0XFFC5C5C5)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText ?? "Search 'ice-cream'",
          hintStyle: TextStyle(fontSize: 13, fontFamily: "regular"),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/images/search.png"),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/images/mic.png"),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }

  // ==================== CUSTOM BUTTON ====================
  static CustomButton({
    required VoidCallback callback,
    String text = "ADD",
    double? width,
    double? height,
  }) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: height ?? 30,
        width: width ?? 55,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0XFF27AF34)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0XFF27AF34),
            ),
          ),
        ),
      ),
    );
  }

  // ==================== RESPONSIVE WRAPPER ====================
   
  // Desktop (≥800px) → content centered with maxWidth 1200px
  // Tablet (600-799px) → content centered with maxWidth 740px
  // Mobile (<600px) → full width, no centering needed

  static Widget responsiveWrapper({
    required BuildContext context,
    required Widget child,
    double maxWidth = 1200,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;
    final isTablet = screenWidth >= 600 && screenWidth < 800;

    if (!isDesktop && !isTablet) {
       return child;
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isDesktop ? maxWidth : 740,
        ),
        child: child,
      ),
    );
  }
}
