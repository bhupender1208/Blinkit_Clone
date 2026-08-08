import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';
import '../bottomnav/bottomnavscreen.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Uihelper.CustomImage(img: "Blinkit Onboarding Screen.png"),
              SizedBox(height: 30),
              Uihelper.CustomImage(img: "image 10.png"),
              SizedBox(height: 20),
              Uihelper.CustomText(
                text: "India’s last minute app",
                color: Color(0XFF000000),
                fontweigt: FontWeight.bold,
                fontsize: 20,
                fontfamily: "bold",
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Uihelper.CustomText(
                          text: "Akash Prajapati",
                          color: Color(0XFF000000),
                          fontweigt: FontWeight.w500,
                          fontsize: 14,
                        ),
                        SizedBox(height: 5),
                        Uihelper.CustomText(
                          text: "8448XXXX58",
                          color: Color(0XFF9C9C9C),
                          fontweigt: FontWeight.bold,
                          fontsize: 14,
                          fontfamily: "bold",
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),

                          child: SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Bottomnavscreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0XFFE23744),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Uihelper.CustomText(
                                    text: "Login  with",
                                    color: Color(0XFFFFFFFF),
                                    fontweigt: FontWeight.bold,
                                    fontsize: 14,
                                    fontfamily: "bold",
                                  ),
                                  SizedBox(width: 5),
                                  Uihelper.CustomImage(img: "image 9.png"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Uihelper.CustomText(
                          text:
                              "Access your saved addresses from Zomato automatically!",
                          color: Color(0XFF9C9C9C),
                          fontweigt: FontWeight.normal,
                          fontsize: 10,
                        ),
                        SizedBox(height: 15),
                        Uihelper.CustomText(
                          text: "or login with phone number",
                          color: Color(0XFF269237),
                          fontweigt: FontWeight.normal,
                          fontsize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
