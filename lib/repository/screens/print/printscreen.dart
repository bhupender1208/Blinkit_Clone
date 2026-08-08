import 'package:flutter/material.dart'; 
import '../../widgets/uihelper.dart';

class Printscreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFBF0CE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Stack(
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  color: Color(0XFFF7CB45),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Uihelper.CustomText(
                            text: "Blinkit in",
                            color: Color(0XFF000000),
                            fontweigt: FontWeight.bold,
                            fontsize: 15,
                            fontfamily: "bold",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Uihelper.CustomText(
                            text: "16 minutes",
                            color: Color(0XFF000000),
                            fontweigt: FontWeight.bold,
                            fontsize: 20,
                            fontfamily: "bold",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Uihelper.CustomText(
                            text: "Home ",
                            color: Color(0XFF000000),
                            fontweigt: FontWeight.bold,
                            fontsize: 14,
                            fontfamily: "bold",
                          ),
                          Uihelper.CustomText(
                            text: "- Akash Prajapati, Harsh Vihar, (Delhi)",
                            color: Color(0XFF000000),
                            fontweigt: FontWeight.bold,
                            fontsize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 100,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.black, size: 20),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: Uihelper.CustomTextField(controller: searchController),
                ),
              ],
            ),
            SizedBox(height: 30),
            Uihelper.CustomText(
              text: 'Print Store',
              color: Colors.black,
              fontweigt: FontWeight.bold,
              fontsize: 32,
              fontfamily: 'bold',
            ),
            Uihelper.CustomText(
              text: 'Blinkit ensures secure prints at every stage',
              color: Color(0XFF9C9C9C),
              fontweigt: FontWeight.bold,
              fontsize: 14,
              fontfamily: 'bold',
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children:[ Container(
                  height: 163,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0XFFFFFFFF),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Uihelper.CustomText(
                            text: 'Documents',
                            color: Colors.black,
                            fontweigt: FontWeight.bold,
                            fontsize: 14,
                            fontfamily: 'bold',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Uihelper.CustomText(
                            text: "✦",
                            color: Color(0XFF9C9C9C),
                            fontweigt: FontWeight.bold,
                            fontsize: 14,
                            fontfamily: 'bold',
                          ),
                          SizedBox(width: 15),
                          Uihelper.CustomText(
                            text: "Price starting at rs 3/page",
                            color: Color(0XFF9C9C9C),
                            fontweigt: FontWeight.normal,
                            fontsize: 14,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(width: 10),
                          Uihelper.CustomText(
                            text: "✦",
                            color: Color(0XFF9C9C9C),
                            fontweigt: FontWeight.bold,
                            fontsize: 14,
                            fontfamily: 'bold',
                          ),
                          SizedBox(width: 15),
                          Uihelper.CustomText(
                            text: "Paper quality: 70 GSM",
                            color: Color(0XFF9C9C9C),
                            fontweigt: FontWeight.normal,
                            fontsize: 14,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(width: 10),
                          Uihelper.CustomText(
                            text: "✦",
                            color: Color(0XFF9C9C9C),
                            fontweigt: FontWeight.bold,
                            fontsize: 14,
                            fontfamily: 'bold',
                          ),
                          SizedBox(width: 15),
                          Uihelper.CustomText(
                            text: "Single side prints",
                            color: Color(0XFF9C9C9C),
                            fontweigt: FontWeight.normal,
                            fontsize: 14,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          SizedBox(
                            height: 40,
                            width: 125,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0XFF27AF34),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(
                                "Upload Files",
                                style: TextStyle(fontSize: 13, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                  Positioned(child:
                  Uihelper.CustomImage(img: 'image 62.png'),
                    right: 20,
                    bottom: 40,
                  )
              ],

              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
