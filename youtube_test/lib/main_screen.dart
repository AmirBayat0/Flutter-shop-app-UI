import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexOfBTB = 0;
  int indexOfPageview = 0;
  int indexOfCategories = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    /// For Changing Index of Page View Automatically
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (indexOfPageview < 12) {
        indexOfPageview++;
        pageController.animateToPage(
          indexOfPageview,
          duration: const Duration(milliseconds: 350),
          curve: Curves.ease,
        );
      } else {
        indexOfPageview = -1;
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// List of Icons(for Categories) just for debuging
  List<IconData> icons = [
    Icons.safety_check,
    Icons.ac_unit,
    Icons.label,
    Icons.data_saver_on_outlined,
    Icons.umbrella_outlined,
    Icons.widgets,
    Icons.earbuds_battery,
    Icons.safety_check,
    Icons.wallet,
    Icons.gps_fixed,
    Icons.hourglass_full,
    Icons.spa_rounded
  ];

  String showProductName(index) {
    switch (index) {
      case 0:
        return "Dresses";
      case 1:
        return "Tops, Tees & Blouses";
      case 2:
        return "Sweaters";
      case 3:
        return "Jeans";
      case 4:
        return "Leggings";
      case 5:
        return "Active";
      case 6:
        return "Skirts";
      case 7:
        return "Socks & Hosiery";
      case 8:
        return "Suiting & Blazers";
      case 9:
        return "Bodysuits";
      case 10:
        return "Shorts";
      case 11:
        return "ُShoes";
      case 12:
        return "Sweaters";

      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(3)),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search_sharp,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ],
              ),

              /// Titles
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello Amir 👋",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text(
                      "Lets get somthing?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),

              /// Page View
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (val) {
                        setState(() {
                          indexOfPageview = val;
                        });
                      },
                      itemCount: 13,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/${index + 1}.jpg'),
                                fit: BoxFit.cover),
                          ),
                        );
                      }),
                ),
              ),

              /// Page Indicator
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child:
                    Align(alignment: Alignment.center, child: pageindicator()),
              ),

              /// Top Categories Text
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Top Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "SEE ALL",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              /// Categories List
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: icons.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              indexOfCategories = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            margin: const EdgeInsets.all(3),
                            width: 55,
                            decoration: BoxDecoration(
                                color: indexOfCategories == index
                                    ? Colors.deepOrangeAccent
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Icon(
                                icons[index],
                                color: indexOfCategories == index
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),

              /// Product List
              SizedBox(
                width: double.infinity,
                height: 218,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "A list of Products will be Shown here",
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      showProductName(indexOfCategories),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent),
                    ),
                    Icon(
                      icons[indexOfCategories],
                      size: 50,
                      color: Colors.deepOrangeAccent,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: bottomNav(),
      ),
    );
  }

  /// Bottom Navigation Bar
  BottomNavyBar bottomNav() {
    return BottomNavyBar(
      selectedIndex: indexOfBTB,
      iconSize: 25,
      curve: Curves.ease,
      showElevation: true,
      onItemSelected: (index) => setState(() {
        indexOfBTB = index;
      }),
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          activeColor: indexOfBTB == 0 ? Colors.deepOrange : Colors.grey,
        ),
        BottomNavyBarItem(
            icon: const Icon(Icons.favorite),
            title: const Text('Favorite'),
            activeColor: indexOfBTB == 1 ? Colors.deepOrange : Colors.grey),
        BottomNavyBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text('Carts'),
            activeColor: indexOfBTB == 2 ? Colors.deepOrange : Colors.grey),
        BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile'),
            activeColor: indexOfBTB == 3 ? Colors.deepOrange : Colors.grey),
      ],
    );
  }

  /// Smooth Page Indicator Widget
  SmoothPageIndicator pageindicator() {
    return SmoothPageIndicator(
      controller: pageController,
      count: 13,
      effect: WormEffect(
          spacing: 5.0,
          radius: 10.0,
          dotWidth: 12.0,
          dotHeight: 12.0,
          dotColor: Colors.grey.shade400,
          activeDotColor: Colors.deepOrange),
      onDotClicked: (newIndex) {
        setState(() {
          pageController.animateToPage(newIndex,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        });
      },
    );
  }
}
