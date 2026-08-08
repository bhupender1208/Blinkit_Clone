import 'package:flutter/material.dart';
// import 'package:blinkit_app/repository/widgets/uihelper.dart';

import '../../widgets/uihelper.dart';

class Cartscreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
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
            SizedBox(height: 20),
            Uihelper.CustomImage(img: "shoping_cart.png"),
            SizedBox(height: 20),
            Uihelper.CustomText(
              text: "Reordering will be easy",
              color: Color(0XFF000000),
              fontweigt: FontWeight.bold,
              fontsize: 16,
              fontfamily: 'bold',
            ),

            Uihelper.CustomText(
              text: "Items you order will show up here so you can buy",
              color: Color(0XFF000000),
              fontweigt: FontWeight.bold,
              fontsize: 12,
            ),
            Uihelper.CustomText(
              text: "them again easily.",
              color: Color(0XFF000000),
              fontweigt: FontWeight.bold,
              fontsize: 12,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 20),
                Uihelper.CustomText(
                  text: "Bestsellers",
                  color: Color(0XFF000000),
                  fontweigt: FontWeight.bold,
                  fontsize: 16,
                  fontfamily: 'bold',
                ),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Uihelper.CustomImage(img: 'milk.png'),
                          Padding(
                            padding: EdgeInsets.only(top: 95, left: 65),
                            child: Uihelper.CustomButton(() {}),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Uihelper.CustomText(
                        text: 'Amul Taaza Toned',
                        color: Color(0XFF000000),
                        fontweigt: FontWeight.w500,
                        fontsize: 10,
                      ),
                      SizedBox(height: 2),
                      Uihelper.CustomText(
                        text: 'Fresh Milk',
                        color: Color(0XFF000000),
                        fontweigt: FontWeight.w500,
                        fontsize: 10,
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Uihelper.CustomImage(img: 'timer 1.png'),
                          SizedBox(width: 5),
                          Uihelper.CustomText(
                            text: '16 MINS',
                            color: Color(0XFF000000),
                            fontweigt: FontWeight.w500,
                            fontsize: 10,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Uihelper.CustomImage(img: 'rupees.png'),
                          SizedBox(width: 5),
                          Uihelper.CustomText(
                            text: '27',
                            color: Color(0XFF000000),
                            fontweigt: FontWeight.bold,
                            fontsize: 15,
                            fontfamily: 'bold',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Uihelper.CustomImage(img: 'potato.png'),
                          Padding(
                            padding: EdgeInsets.only(top: 95, left: 65),
                            child: Uihelper.CustomButton(() {}),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Uihelper.CustomText(
                        text: 'Potato (Aloo)',
                        color: Color(0XFF000000),
                        fontweigt: FontWeight.w500,
                        fontsize: 10,
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          Uihelper.CustomImage(img: 'timer 1.png'),
                          SizedBox(width: 5),
                          Uihelper.CustomText(
                            text: '16 MINS',
                            color: Color(0XFF000000),
                            fontweigt: FontWeight.w500,
                            fontsize: 10,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Uihelper.CustomImage(img: 'rupees.png'),
                          SizedBox(width: 5),
                          Uihelper.CustomText(
                            text: '37',
                            color: Color(0XFF000000),
                            fontweigt: FontWeight.bold,
                            fontsize: 15,
                            fontfamily: 'bold',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Uihelper.CustomImage(img: 'tamato.png'),
                          Padding(
                            padding: EdgeInsets.only(top: 95, left: 65),
                            child: Uihelper.CustomButton(() {}),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Uihelper.CustomText(
                        text: 'Hybrid Tomato',
                        color: Color(0XFF000000),
                        fontweigt: FontWeight.w500,
                        fontsize: 10,
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          Uihelper.CustomImage(img: 'timer 1.png'),
                          SizedBox(width: 5),
                          Uihelper.CustomText(
                            text: '16 MINS',
                            color: Color(0XFF000000),
                            fontweigt: FontWeight.w500,
                            fontsize: 10,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Uihelper.CustomImage(img: 'rupees.png'),
                          SizedBox(width: 5),
                          Uihelper.CustomText(
                            text: '37',
                            color: Color(0XFF000000),
                            fontweigt: FontWeight.bold,
                            fontsize: 15,
                            fontfamily: 'bold',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
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
