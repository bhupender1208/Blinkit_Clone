import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';
class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;
    final isTablet = screenWidth >= 600 && screenWidth < 800;

    // Responsive grid: mobile=2, tablet=3, desktop=5
    final crossAxisCount = isDesktop ? 5 : (isTablet ? 3 : 2);

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
              SizedBox(height: 20),

              // ============ CART TITLE ============
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
                child: Row(
                  children: [
                    Uihelper.CustomText(
                      text: "My Cart",
                      color: Colors.black,
                      fontweigt: FontWeight.w800,
                      fontsize: isDesktop ? 26 : 22,
                    ),
                    Spacer(),
                    Uihelper.CustomText(
                      text: "0 items",
                      color: Colors.black54,
                      fontweigt: FontWeight.w500,
                      fontsize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // ============ EMPTY CART ============
              _buildEmptyCart(isDesktop),
              SizedBox(height: 30),

              // ============ BESTSELLERS SECTION ============
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
                child: Uihelper.CustomText(
                  text: "Bestsellers",
                  color: Colors.black,
                  fontweigt: FontWeight.w700,
                  fontsize: 20,
                ),
              ),
              SizedBox(height: 12),

              // ============ BESTSELLERS RESPONSIVE GRID ============
              _buildBestsellersGrid(crossAxisCount, isDesktop),

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
      // height: 190,
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
        hintText: "Search in cart...",
      ),
    );
  }

  Widget _buildEmptyCart(bool isDesktop) {
    return Center(
      child: Column(
        children: [
          Uihelper.CustomImage(
            img: "shopping_cart.png",
            height: isDesktop ? 160 : 130,
            width: isDesktop ? 160 : 130,
          ),
          SizedBox(height: 16),
          Uihelper.CustomText(
            text: "Your cart is empty",
            color: Colors.black87,
            fontweigt: FontWeight.w700,
            fontsize: isDesktop ? 20 : 16,
          ),
          SizedBox(height: 6),
          Uihelper.CustomText(
            text: "Add items to get started",
            color: Colors.black45,
            fontweigt: FontWeight.w400,
            fontsize: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildBestsellersGrid(int crossAxisCount, bool isDesktop) {
    final bestsellers = [
      {
        "img": "milk.png",
        "name": "Amul Taaza Milk",
        "desc": "Toned, 500 ml",
        "time": "16 mins",
        "price": "₹27",
      },
      {
        "img": "potato.png",
        "name": "Fresh Potato",
        "desc": "1 kg pack",
        "time": "16 mins",
        "price": "₹36",
      },
      {
        "img": "tomato.png",
        "name": "Fresh Tomato",
        "desc": "500 g",
        "time": "19 mins",
        "price": "₹25",
      },
      {
        "img": "onion.png",
        "name": "Fresh Onion",
        "desc": "1 kg",
        "time": "16 mins",
        "price": "₹30",
      },
       
      {
        "img": "eggs.png",
        "name": "Farm Eggs",
        "desc": "6 pieces",
        "time": "20 mins",
        "price": "₹48",
      },
      {
        "img": "butter.png",
        "name": "Amul Butter",
        "desc": "100 g",
        "time": "14 mins",
        "price": "₹55",
      },
       {
        "img": "curd.png",
        "name": "Amul Curd",
        "desc": "400 g",
        "time": "15 mins",
        "price": "₹32",
      },
       {
        "img": "cheese.png",
        "name": "Amul Cheese",
        "desc": "200 g",
        "time": "18 mins",
        "price": "₹90",
      },
      ];       

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          // childAspectRatio: 0.65,
          childAspectRatio: isDesktop ? 0.65 : 0.75, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
        ),
        itemCount: bestsellers.length,
        itemBuilder: (context, index) {
          final item = bestsellers[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0XFFE8E8E8)),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Uihelper.CustomImage(
                    img: item["img"]!,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 8),
                Uihelper.CustomText(
                  text: item["name"]!,
                  color: Colors.black87,
                  fontweigt: FontWeight.w600,
                  fontsize: 13,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                if (item["desc"] != null)
                  Uihelper.CustomText(
                    text: item["desc"]!,
                    color: Colors.black45,
                    fontweigt: FontWeight.w400,
                    fontsize: 11,
                    maxLines: 1,
                  ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Uihelper.CustomText(
                      text: item["time"]!,
                      color: Colors.black54,
                      fontweigt: FontWeight.w500,
                      fontsize: 11,
                    ),
                    Uihelper.CustomText(
                      text: item["price"]!,
                      color: Colors.black,
                      fontweigt: FontWeight.w700,
                      fontsize: 14,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // ADD button
                Container(
                  width: double.infinity,
                  height: 32,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0XFF27AF34)),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "ADD",
                      style: TextStyle(
                        color: Color(0XFF27AF34),
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
