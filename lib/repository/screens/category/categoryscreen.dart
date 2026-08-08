import 'package:flutter/material.dart'; 
import '../../widgets/uihelper.dart';
class Categoryscreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  var groceryKitchen = [
    {"img": "image 41.png", "text": "Vegetables & \nFruits"},
    {"img": "image 42.png", "text": "Atta, Dal & \nRice"},
    {"img": "image 43.png", "text": "Oil, Ghee & \nMasala"},
    {"img": "image 44 (1).png", "text": "Dairy, Bread & \nMilk"},
    {"img": "image 45 (1).png", "text": "Biscuits & \nBakery"},
  ];

  var secondGrocery = [
    {"img": "image 21.png", "text": "Dry Fruits &\n Cereals"},
    {"img": "image 22.png", "text": "Kitchen &\n Appliances"},
    {"img": "image 23.png", "text": "Tea &\n Coffees"},
    {"img": "image 24.png", "text": "Ice Creams &\n much more"},
    {"img": "image 25.png", "text": "Noodles &\n Packet Food"},
  ];

  var snacksDrinks = [
    {"img": "image 31.png", "text": "Chips &\nNamkeens"},
    {"img": "image 32.png", "text": "Sweets &\nChocalates"},
    {"img": "image 33.png", "text": "Drinks &\n Juices"},
    {"img": "image 34.png", "text": "Sauces &\nSpreads"},
    {"img": "image 35.png", "text": "Beauty &\nCosmetics"},
  ];

  var houseHold = [
    {"img": "image 36.png"},
    {"img": "image 37.png"},
    {"img": "image 38.png"},
    {"img": "image 39.png"},
    {"img": "image 40.png"},
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
            SizedBox(height: 10),
            SizedBox(
               height: 125,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 78,
                              width: 71,
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

            SizedBox(height: 20),
            SizedBox(
               height: 125,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 78,
                              width: 71,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0XFFD9EBEB),
                              ),
                              child: Uihelper.CustomImage(
                                img: secondGrocery[index]['img'].toString(),
                              ),
                            ),
                          ),
                          Uihelper.CustomText(
                            text: secondGrocery[index]['text'].toString(),
                            color: Colors.black,
                            fontweigt: FontWeight.normal,
                            fontsize: 10,
                          ),
                        ],
                      );
                    },
                    itemCount: secondGrocery.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),

            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 20),
                Uihelper.CustomText(
                  text: 'Snacks & Drinks',
                  color: Colors.black,
                  fontweigt: FontWeight.bold,
                  fontsize: 14,
                  fontfamily: 'bold',
                ),
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(
               height: 125,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 78,
                              width: 71,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0XFFD9EBEB),
                              ),
                              child: Uihelper.CustomImage(
                                img: snacksDrinks[index]['img'].toString(),
                              ),
                            ),
                          ),
                          Uihelper.CustomText(
                            text: snacksDrinks[index]['text'].toString(),
                            color: Colors.black,
                            fontweigt: FontWeight.normal,
                            fontsize: 10,
                          ),
                        ],
                      );
                    },
                    itemCount: snacksDrinks.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 20),
                Uihelper.CustomText(
                  text: 'Household Essentials',
                  color: Colors.black,
                  fontweigt: FontWeight.bold,
                  fontsize: 14,
                  fontfamily: 'bold',
                ),
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(
             height: 125,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 78,
                          width: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0XFFD9EBEB),
                          ),
                          child: Uihelper.CustomImage(
                            img: houseHold[index]['img'].toString(),
                          ),
                        ),
                      );
                    },
                    itemCount: houseHold.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
