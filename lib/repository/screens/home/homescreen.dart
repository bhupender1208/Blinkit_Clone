import 'package:flutter/material.dart';
// import 'package:blinkit_app/repository/widgets/uihelper.dart';

import '../../widgets/uihelper.dart';

class Homescreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  var data = [
    {"img": "image 50.png", "text": "Lights, Diyas \n & Candles"},
    {"img": "image 51.png", "text": "Diwali \n Gifts"},
    {"img": "image 52.png", "text": "Appliances \n & Gadgets"},
    {"img": "image 53.png", "text": "Home \n & Living"},
  ];

  var category = [
    {"img": "image 54.png", "text": "Golden Glass \nWooden Lid Candle"},
    {"img": "image 57.png", "text": "Royal Gulab Jamun \nBy Bikano"},
    {"img": "image 63.png", "text": "Bikaji Bhujia (1kg) \nPacket By Bikano"},
  ];

  var groceryKitchen = [
    {"img": "image 41.png", "text": "Vegetables & \nFruits"},
    {"img": "image 42.png", "text": "Atta, Dal & \nRice"},
    {"img": "image 43.png", "text": "Oil, Ghee & \nMasala"},
    {"img": "image 44 (1).png", "text": "Dairy, Bread & \nMilk"},
    {"img": "image 45 (1).png", "text": "Biscuits & \nBakery"},
  ];

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
                  color: Color(0XFFEC0505),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Uihelper.CustomText(
                            text: "Blinkit in",
                            color: Color(0XFFFFFFFF),
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
                            color: Color(0XFFFFFFFF),
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
                            color: Color(0XFFFFFFFF),
                            fontweigt: FontWeight.bold,
                            fontsize: 14,
                            fontfamily: "bold",
                          ),
                          Uihelper.CustomText(
                            text: "- Akash Prajapati, Harsh Vihar, (Delhi)",
                            color: Color(0XFFFFFFFF),
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
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person, color: Colors.white, size: 20),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: Uihelper.CustomTextField(controller: searchController),
                ),
              ],
            ),
            Container(height: 1, width: double.infinity, color: Colors.white),
            Container(
              height: 216,
              width: double.infinity,
              color: Color(0XFFEC0505),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Uihelper.CustomImage(img: 'image 60.png'),
                      // SizedBox(width: 10),
                      Uihelper.CustomImage(img: "image 55.png"),
        
                      Uihelper.CustomText(
                        text: 'Mega Diwali Sale',
                        color: Colors.white,
                        fontweigt: FontWeight.bold,
                        fontsize: 20,
                        fontfamily: 'bold',
                      ),
                      Uihelper.CustomImage(img: "image 56.png"),
                      Uihelper.CustomImage(img: "image 61.png"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                              top: 1,
                              bottom: 1,
                            ),
                            child: Container(
                              height: 108,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0XFFEAD3D3),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Uihelper.CustomText(
                                    text: data[index]["text"].toString(),
                                    color: Colors.black,
                                    fontweigt: FontWeight.bold,
                                    fontsize: 10,
                                  ),
                                  Uihelper.CustomImage(
                                    img: data[index]["img"].toString(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // --- Category List (Sahi Alignment Wala Part) ---
            SizedBox(
             height: 190,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    itemCount: category.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 128, // Har ek product card ki fixed width
                        margin: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Sab kuch left se align karega
                          children: [
                            // Image Box
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 108,
                              width: 93,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Uihelper.CustomImage(
                                img: category[index]["img"].toString(),
                              ),
                            ),
                            SizedBox(height: 6),
                            // Product Text
                            Uihelper.CustomText(
                              text: category[index]["text"].toString(),
                              color: Colors.black,
                              fontweigt: FontWeight.bold,
                              fontsize: 9,
                            ),
                            SizedBox(height: 4),
                            // Timer Row
                            Row(
                              children: [
                                Uihelper.CustomImage(img: 'timer 1.png'),
                                SizedBox(width: 4),
                                Uihelper.CustomText(
                                  text: '16 MINS',
                                  color: Color(0XFF000000),
                                  fontweigt: FontWeight.normal,
                                  fontsize: 9,
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            // Price Row
                            Row(
                              children: [
                                Uihelper.CustomImage(img: 'rupees.png'),
                                SizedBox(width: 2),
                                Uihelper.CustomText(
                                  text: '79',
                                  color: Colors.black,
                                  fontweigt: FontWeight.bold,
                                  fontsize: 13,
                                  fontfamily: 'bold',
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),

              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                Uihelper.CustomText(
                  text: 'Grocery & Kitchen',
                  color: Color(0XFF000000),
                  fontweigt: FontWeight.bold,
                  fontsize: 14,
                  fontfamily: 'bold',
                ),
              ],
            ),
            SizedBox(height: 7,),
            SizedBox(
              height: 130,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),                        child: Container(
                            height: 78,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFD9EBEB),
                            ),
                            child: Uihelper.CustomImage(
                              img: groceryKitchen[index]['img'].toString(),
                            ),
                          ),
                        ),
                        Uihelper.CustomText(
                          text: groceryKitchen[index]['text'].toString(),
                          color: Colors.black,
                          fontweigt: FontWeight.normal,
                          fontsize: 10,
                        ),
                      ],
                    );
                  },
                  itemCount: groceryKitchen.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

