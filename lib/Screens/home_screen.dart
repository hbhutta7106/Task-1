import 'package:api_project/Widgets/image_container.dart';
import 'package:api_project/Widgets/product.dart';
import 'package:api_project/Widgets/small_icon.dart';
import 'package:api_project/constants.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    'Men',
    "Women",
    "Childerens",
    "Etc",
  ];

  late int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  late String selectedCategory = categories.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: screenColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  func: () {},
                  imagePath: "assets/images/shirt.jpg",
                  height: 45.0,
                  width: 45.0,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryTextColor,
                  ),
                  child: Center(
                    child: DropdownButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      underline: const SizedBox.shrink(),
                      value: selectedCategory,
                      selectedItemBuilder: (context) {
                        return categories.map((String item) {
                          return SizedBox(
                            height: 50,
                            width: 50,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                item,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      items: categories.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(item),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                CustomContainer(
                  func: () {},
                  icon: Icons.shopping_bag_outlined,
                  height: 40,
                  width: 40,
                  color: const Color.fromRGBO(142, 108, 239, 1),
                  iconColor: screenColor,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: buildSeacrchBar(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    rowWithText(() {}, "Categories", "See All", null),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cateogoriesWidget(
                              "assets/images/short.jpg", "Shorts"),
                          const SizedBox(
                            width: 10,
                          ),
                          cateogoriesWidget("assets/images/pants.jpg", "Pants"),
                          const SizedBox(
                            width: 10,
                          ),
                          cateogoriesWidget(
                              "assets/images/images.jpg", "Shoes"),
                          const SizedBox(
                            width: 10,
                          ),
                          cateogoriesWidget("assets/images/bags.jpg", "Bags"),
                          const SizedBox(
                            width: 10,
                          ),
                          cateogoriesWidget(
                              "assets/images/accs.jpg", "Accesories"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: rowWithText(() {}, "Top Selling", "See All", null),
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductCard(
                        imagePath: "assets/images/casual_shirt.webp",
                        productName: "Men's Harrington Jacket",
                        price: "148.00",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ProductCard(
                        imagePath: "assets/images/chappal.webp",
                        productName: "Max Cirro Men's Slides",
                        price: "55.00",
                        offPrice: "100.97",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ProductCard(
                        imagePath: "assets/images/hoodie.webp",
                        productName: "Max Cirro Men's Slides",
                        price: "55.00",
                        offPrice: "100.97",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: rowWithText(() {}, "New In", "See All", Colors.blue)),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductCard(
                        imagePath: "assets/images/hoodie.webp",
                        productName: "Max Cirro Men's Slides",
                        price: "55.00",
                        offPrice: "100.97",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ProductCard(
                        imagePath: "assets/images/casual_shirt.webp",
                        productName: "Men's Harrington Jacket",
                        price: "148.00",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ProductCard(
                        imagePath: "assets/images/chappal.webp",
                        productName: "Max Ciro Men's Slides",
                        price: "55.00",
                        offPrice: "100.97",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSeacrchBar() {
  return Container(
    decoration: BoxDecoration(
      color: primaryTextColor,
      borderRadius: BorderRadius.circular(40),
    ),
    child: const TextField(
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search_rounded),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    ),
  );
}

Widget rowWithText(
    VoidCallback funciton, String text1, text2, Color? text1color) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
              color: text1color ?? secondaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
        Text(
          text2,
          style: const TextStyle(
            color: secondaryTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget cateogoriesWidget(String imagePath, String nameofCategory) {
  return Container(
    padding: const EdgeInsets.all(5),
    child: Column(
      children: [
        ContainerWithImage(imagePath: imagePath, height: 55, width: 55),
        const SizedBox(height: 5),
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              nameofCategory,
              style: const TextStyle(fontSize: 12),
            )),
      ],
    ),
  );
}
