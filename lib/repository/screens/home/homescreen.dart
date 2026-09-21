import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';
class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;
    final isTablet = screenWidth >= 600 && screenWidth < 800;

    // Responsive cross axis count for grids
    final crossAxisCount = isDesktop ? 5 : (isTablet ? 3 : 2);

    return Scaffold(
      body: Uihelper.responsiveWrapper(
        context: context,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============ HEADER ============
              // SizedBox(height: 14),
              _buildHeader(context, isDesktop),
              SizedBox(height: 8),

              // ============ SEARCH BAR ============
              _buildSearchBar(isDesktop),
              SizedBox(height: 16),

              // ============ MEGA DIWALI SALE BANNER ============
              _buildDiwaliBanner(isDesktop),
              SizedBox(height: 18),

              // ============ DIWALI GIFTS HORIZONTAL ============
              _buildSectionTitle("Diwali Gifts", isDesktop),
              SizedBox(height: 10),
              _buildHorizontalGiftsList(isDesktop),
              SizedBox(height: 22),

              // ============ FESTIVE ITEMS GRID ============
              _buildSectionTitle("Mega Diwali Sale", isDesktop),
              SizedBox(height: 10),
              _buildFestiveItemsGrid(crossAxisCount, isDesktop),
              SizedBox(height: 22),

              // ============ GROCERY & KITCHEN ============
              _buildSectionTitle("Grocery & Kitchen", isDesktop),
              SizedBox(height: 10),
              _buildGroceryGrid(crossAxisCount, isDesktop),

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
      ),
    );
  }

  Widget _buildDiwaliBanner(bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 12),
      child: Container(
        width: double.infinity,
        height: isDesktop ? 200 : 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: [Color(0XFFE73837), Color(0XFFC62828)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: isDesktop ? 28 : 16,
              top: isDesktop ? 40 : 28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Uihelper.CustomText(
                    text: "MEGA DIWALI",
                    color: Colors.white,
                    fontweigt: FontWeight.w900,
                    fontsize: isDesktop ? 30 : 22,
                  ),
                  Uihelper.CustomText(
                    text: "SALE",
                    color: Color(0XFFFFD700),
                    fontweigt: FontWeight.w900,
                    fontsize: isDesktop ? 36 : 28,
                  ),
                  SizedBox(height: isDesktop ? 10 : 6),
                  Uihelper.CustomText(
                    text: "Up to 50% off",
                    color: Colors.white.withOpacity(0.9),
                    fontweigt: FontWeight.w600,
                    fontsize: isDesktop ? 16 : 13,
                  ),
                ],
              ),
            ),
            Positioned(
              right: isDesktop ? 20 : 8,
              bottom: 8,
              child: Icon(
                Icons.celebration,
                color: Colors.white.withOpacity(0.3),
                size: isDesktop ? 100 : 70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
      child: Row(
        children: [
          Uihelper.CustomText(
            text: title,
            color: Colors.black,
            fontweigt: FontWeight.w700,
            fontsize: isDesktop ? 20 : 17,
          ),
          Spacer(),
          Uihelper.CustomText(
            text: "See all",
            color: Color(0XFF0C831A),
            fontweigt: FontWeight.w600,
            fontsize: 13,
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalGiftsList(bool isDesktop) {
    final gifts = [
      {"img": "diya.png", "name": "Lights, Diyas & Candles"},
      {"img": "gift_hamper.png", "name": "Diwali Gifts"},
      {"img": "appliances.png", "name": "Appliances & Gadgets"},
      {"img": "home_living.png", "name": "Home & Living"},
      {"img": "decor.png", "name": "Home Decor"},
      {"img": "sweets.png", "name": "Sweets & Mithai"},
      {"img": "dryfruits.png", "name": "Dry Fruits"},
      {"img": "cadbury.png", "name": "CadburyDark Chocolate"},
      {"img": "fragnance.png", "name": "Jasmine Fragrance"},
      
    ];

    return SizedBox(
      height: isDesktop ? 130 : 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: isDesktop ? 28 : 10),
        itemCount: gifts.length,
        itemBuilder: (context, index) {
          final item = gifts[index];
          return Container(
            width: isDesktop ? 120 : 95,
            margin: EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                Container(
                  height: isDesktop ? 80 : 70,
                  width: isDesktop ? 80 : 70,
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
                  text: item["name"]!,
                  color: Colors.black87,
                  fontweigt: FontWeight.w500,
                  fontsize: isDesktop ? 11 : 10,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFestiveItemsGrid(int crossAxisCount, bool isDesktop) {
    final items = [
      {"img": "candle.jpg", "name": "Glass Wooden Lid Candle", "time": "16 mins", "price": "₹69"},
      {"img": "gulab_jamun.jpg", "name": "Royal Gulab Jamun By Bikano", "time": "18 mins", "price": "₹89"},
      {"img": "bhujia.jpg", "name": "Bikaji Bhujia (1kg) Packet By Bikano", "time": "20 mins", "price": "₹149"},
      {"img": "puja_thali.png", "name": "Puja Thali", "time": "22 mins", "price": "₹399"},
      {"img": "silver.png", "name": "Silver Laxmi Ganesh", "time": "25 mins", "price": "₹999"},
    ];

    return _buildProductGrid(items, crossAxisCount, isDesktop);
  }

  Widget _buildGroceryGrid(int crossAxisCount, bool isDesktop) {
    final items = [      
      {"img": "oil.jpg", "name": "Oils & Ghee", "time": "22 mins", "price": "₹145"},
      {"img": "spices.jpg", "name": "Spices", "time": "18 mins", "price": "₹55"},
      {"img": "snacks.jpg", "name": "Snacks", "time": "14 mins", "price": "₹40"},
      {"img": "tea.jpg", "name": "Tea & Coffee", "time": "16 mins", "price": "₹99"},
      {"img": "aata.jpg", "name": "Atta & Flour", "time": "20 mins", "price": "₹165"},
    ];

    return _buildProductGrid(items, crossAxisCount, isDesktop);
  }

  Widget _buildProductGrid(List<Map<String, String>> items, int crossAxisCount, bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
           childAspectRatio: isDesktop ? 0.65 : 0.75,  
          crossAxisSpacing: 8,
          mainAxisSpacing: 10,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0XFFE8E8E8)),
            ),
            padding: EdgeInsets.all(8),
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
                SizedBox(height: 6),
                Uihelper.CustomText(
                  text: item["name"]!,
                  color: Colors.black87,
                  fontweigt: FontWeight.w600,
                  fontsize: 12,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Uihelper.CustomText(
                      text: item["time"]!,
                      color: Colors.black54,
                      fontweigt: FontWeight.w500,
                      fontsize: 10,
                    ),
                    Uihelper.CustomText(
                      text: item["price"]!,
                      color: Colors.black,
                      fontweigt: FontWeight.w700,
                      fontsize: 13,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  height: 28,
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
                        fontSize: 12,
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
