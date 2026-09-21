import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';
class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key});

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
              SizedBox(height: 20),

              // ============ GROCERY & KITCHEN ============
              _buildCategorySection(
                "Grocery & Kitchen",
                [
                  {"img": "vegetables.png", "text": "Vegetables"},
                  {"img": "fruits.png", "text": "Fruits"},
                  {"img": "milks.png", "text": "Dairy"},
                  {"img": "bread.png", "text": "Bakery"},
                  {"img": "rice.png", "text": "Rice"},
                  {"img": "oils.png", "text": "Oils"},
                  {"img": "spices.png", "text": "Spices"},
                  {"img": "atta.jpg", "text": "Atta"},
                  {"img": "corn.jpg", "text": "Corn Flakes"},                 
                ],
                isDesktop,
              ),

              // ============ SNACKS & DRINKS ============
              _buildCategorySection(
                "Snacks & Drinks",
                [
                  {"img": "chips.png", "text": "Chips"},
                  {"img": "biscuits.png", "text": "Biscuits"},
                  {"img": "cold_drink.png", "text": "Cold Drinks"},
                  {"img": "juice.png", "text": "Juices"},
                  {"img": "chocolate.png", "text": "Chocolates"},
                  {"img": "namkeen.png", "text": "Namkeen"},
                  {"img": "icecream.png", "text": "Ice Cream"},
                  {"img": "tea.jpg", "text": "Tea & Coffee"},
                  {"img": "angles.png", "text": "Mad Angles"},
                ],
                isDesktop,
              ),

              // ============ HOUSEHOLD ESSENTIALS ============
              _buildCategorySection(
                "Household Essentials",
                [
                  {"img": "cleaner.png", "text": "Cleaners"},
                  {"img": "detergent.png", "text": "Detergents"},
                  {"img": "soap.png", "text": "Soaps"},
                  {"img": "shampoo.png", "text": "Shampoo"},
                  {"img": "tissue.png", "text": "Tissues"},
                  {"img": "mosquito.png", "text": "Repellents"},
                  {"img": "airfresh.png", "text": "Air Fresheners"},
                  {"img": "toothpaste.png", "text": "Oral Care"},
                  {"img": "scrub.png", "text": "Scrotch Brite Scrub"},
                ],
                isDesktop,
              ),

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
    decoration: const BoxDecoration(
      color: Color(0XFFF7CB45),
    ),
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 32 : 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
 
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Uihelper.CustomText(
                    text: "Blinkit in",
                    color: Colors.black,
                    fontweigt: FontWeight.bold,
                    fontsize: isDesktop ? 18 : 15,
                  ),

                  Uihelper.CustomText(
                    text: "16 minutes",
                    color: Colors.black,
                    fontweigt: FontWeight.bold,
                    fontsize: isDesktop ? 23 : 20,
                  ),

                  const SizedBox(height: 3),

                  // ====================================
                  // ADDRESS
                  // ====================================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Uihelper.CustomText(
                        text: "Home - ",
                        color: Colors.black,
                        fontweigt: FontWeight.bold,
                        fontsize: isDesktop ? 17 : 14,
                      ),

                      // Remaining available width only
                      Expanded(
                        child: Text(
                          "Akash Prajapati, Harsh Vihar, (Delhi)",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: isDesktop ? 17 : 14,
                            fontFamily: "regular",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              width: isDesktop ? 20 : 10,
            ),

            // ==========================================
            // PROFILE IMAGE
            // ==========================================
            CircleAvatar(
              radius: isDesktop ? 20 : 16,
              backgroundImage: const AssetImage(
                "assets/images/profile.png",
              ),
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
        hintText: "Search categories...",
      ),
    );
  }

  Widget _buildCategorySection(
      String title, List<Map<String, String>> items, bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Uihelper.CustomText(
            text: title,
            color: Colors.black,
            fontweigt: FontWeight.w700,
            fontsize: isDesktop ? 20 : 17,
          ),
          SizedBox(height: 12),
          SizedBox(
            height: isDesktop ? 110 : 95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  width: isDesktop ? 110 : 85,
                  margin: EdgeInsets.only(right: 14),
                  child: Column(
                    children: [
                      Container(
                        height: isDesktop ? 72 : 60,
                        width: isDesktop ? 72 : 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0XFFE8E8E8)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Uihelper.CustomImage(
                            img: item["img"]!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Uihelper.CustomText(
                        text: item["text"]!,
                        color: Colors.black87,
                        fontweigt: FontWeight.w500,
                        fontsize: isDesktop ? 12 : 11,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
