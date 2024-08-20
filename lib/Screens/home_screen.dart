import 'package:api_project/Widgets/image_container.dart';
import 'package:api_project/Widgets/small_icon.dart';
import 'package:api_project/constants.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ['Men', "Women", "Childerens", "Etc"];

  @override
  Widget build(BuildContext context) {
    String selectedCategory = categories[0];
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
                  imagePath: "assets/images/man-woB (1).jpg",
                ),
                categoryDropDownContainer(categories, (String? value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                }, selectedCategory),
                CustomContainer(
                  func: () {},
                  icon: Icons.shopping_bag_outlined,
                  color: const Color.fromRGBO(142, 108, 239, 1),
                  iconColor: screenColor,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0), child: buildSeacrchBar()),
            rowWithText(() {}, "Categories", "See All"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cateogoriesWidget("assets/images/pant.jpg", "Pants"),
                  cateogoriesWidget("assets/images/shorts.jpg", "Shorts"),
                  cateogoriesWidget("assets/images/shoes.jpg", "Shoes"),
                  cateogoriesWidget("assets/images/bags.jpg", "Bag"),
                  cateogoriesWidget("assets/images/accesories.jpg", "Accessories"),
                ],
              ),
            ),
            rowWithText(() {}, "Top Selling", "See All"),
          ],
        ),
      )),
    );
  }
}

Widget categoryDropDownContainer(List<String> list,
    ValueChanged<String?> function, String selectedCategory) {
  return Container(
    padding: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: primaryTextColor,
    ),
    child: Center(
      child: DropdownButton(
        underline: const SizedBox(),
        elevation: 0,
        style: const TextStyle(fontSize: 12, color: secondaryTextColor),
        items: list.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 12),
              ),
            );
          },
        ).toList(),
        onChanged: function,
      ),
    ),
  );
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

Widget rowWithText(VoidCallback funciton, String text1, text2) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(
              color: secondaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w800),
        ),
        Text(
          text2,
          style: const TextStyle(
            color: secondaryTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget cateogoriesWidget(String imagePath, String nameofCategory) {
  return Column(
    children: [
      ContainerWithImage(imagePath: imagePath, height: 40, width: 40),
      const SizedBox(height: 5),
      Text(nameofCategory),
    ],
  );
}
