import 'package:flutter/material.dart';
 import '../../widgets/uihelper.dart';
class Printscreen extends StatelessWidget {
  const Printscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;
    final isTablet = screenWidth >= 600 && screenWidth < 800;

    return Scaffold(
      body: Uihelper.responsiveWrapper(
        context: context,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============ HEADER ============
              _buildHeader(context, isDesktop),
              SizedBox(height: 8),

              // ============ SEARCH BAR ============
              _buildSearchBar(isDesktop),
              SizedBox(height: 24),

              // ============ PRINT STORE HEADING ============
              _buildSectionHeading(isDesktop),
              SizedBox(height: 20),

              // ============ PRINT SERVICE CARD ============
              _buildPrintServiceCard(isDesktop, isTablet),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDesktop) {
    return Container(
      width: double.infinity,       
      height: isDesktop ? 190 : 160,  
      decoration: BoxDecoration(
        color: Color(0XFFF7CB45),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [             
              SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Uihelper.CustomText(
                        text: "Blinkit in",
                        color: Colors.black,
                        fontweigt: FontWeight.bold,
                        fontsize: isDesktop ? 18 : 15,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Uihelper.CustomText(
                        text: "16 minutes",
                        color: Colors.black,
                        fontweigt: FontWeight.bold,
                        fontsize: isDesktop ? 23 : 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Uihelper.CustomText(
                        text: "Home - ",
                        color: Colors.black,
                        fontweigt: FontWeight.bold,
                        fontsize: isDesktop ? 17 : 14,
                      ),
                      Uihelper.CustomText(
                        text: "Akash Prajapati, Harsh Vihar, (Delhi)",
                        color: Colors.black54,
                        fontweigt: FontWeight.w400,
                        fontsize: isDesktop ? 17 : 14,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: isDesktop ? 20 : 16,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 12),
      child: Uihelper.CustomTextField(
        controller: TextEditingController(),
        hintText: "Search for print services...",
      ),
    );
  }

  Widget _buildSectionHeading(bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Uihelper.CustomText(
            text: "Print Store",
            color: Colors.black,
            fontweigt: FontWeight.w800,
            fontsize: isDesktop ? 28 : 24,
          ),
          SizedBox(height: 6),
          Uihelper.CustomText(
            text: "Blinkit ensures secure prints at your doorstep",
            color: Colors.black54,
            fontweigt: FontWeight.w400,
            fontsize: isDesktop ? 15 : 13,
          ),
        ],
      ),
    );
  }

  Widget _buildPrintServiceCard(bool isDesktop, bool isTablet) {
    final horizontalPadding = isDesktop ? 32.0 : (isTablet ? 20.0 : 12.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0XFFE0E0E0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(isDesktop ? 28 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============ DOCUMENTS ROW ============
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Document icon
                Container(
                  height: isDesktop ? 64 : 52,
                  width: isDesktop ? 64 : 52,
                  decoration: BoxDecoration(
                    color: Color(0XFFFFF3E0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.description_outlined,
                    color: Color(0XFFE65100),
                    size: isDesktop ? 32 : 26,
                  ),
                ),
                SizedBox(width: isDesktop ? 20 : 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Uihelper.CustomText(
                        text: "Documents",
                        color: Colors.black,
                        fontweigt: FontWeight.w700,
                        fontsize: isDesktop ? 20 : 17,
                      ),
                      SizedBox(height: 8),

                      // Price per page
                      _buildBulletPoint(
                        "Price starting at ₹3/page",
                        isDesktop,
                      ),
                      SizedBox(height: 6),

                      // Paper quality
                      _buildBulletPoint(
                        "Paper quality: 70 GSM",
                        isDesktop,
                      ),
                      SizedBox(height: 6),

                      // Single side prints
                      _buildBulletPoint(
                        "Single side prints",
                        isDesktop,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: isDesktop ? 28 : 22),

            // ============ DIVIDER ============
            Divider(color: Color(0XFFEEEEEE), height: 1),
            SizedBox(height: isDesktop ? 24 : 18),

            // ============ UPLOAD FILES BUTTON ============
            SizedBox(
              width: double.infinity,
              height: isDesktop ? 54 : 48,
              child: ElevatedButton(
                onPressed: () {
                  // Upload files action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF0C831A),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file,
                      size: isDesktop ? 22 : 19,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Upload Files",
                      style: TextStyle(
                        fontSize: isDesktop ? 17 : 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: "regular",
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: isDesktop ? 16 : 12),

            // ============ SUPPORTED FORMATS ============
            Center(
              child: Uihelper.CustomText(
                text: "Supports: PDF, DOC, DOCX, JPG, PNG",
                color: Colors.black38,
                fontweigt: FontWeight.w400,
                fontsize: isDesktop ? 13 : 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text, bool isDesktop) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: isDesktop ? 5 : 4),
          child: Text(
            "✦",
            style: TextStyle(
              color: Color(0XFFE65100),
              fontSize: isDesktop ? 14 : 12,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Uihelper.CustomText(
            text: text,
            color: Colors.black87,
            fontweigt: FontWeight.w500,
            fontsize: isDesktop ? 15 : 13,
          ),
        ),
      ],
    );
  }
}
