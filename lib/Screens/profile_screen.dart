import 'package:api_project/Widgets/image_container.dart';
import 'package:api_project/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Text(""),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              const ContainerWithImage(
                  imagePath: "assets/images/man-with-b.jpg",
                  height: 100,
                  width: 100),
              const SizedBox(
                height: 25,
              ),
              profileInfoContainer(() {}, "Muhammad Hanan Haider ",
                  "bhuttahanan3@gmail.com", "27-12-2000"),
              const SizedBox(
                height: 20,
              ),
              profileTiles("Address"),
              profileTiles("Wishlist"),
              profileTiles("Payment"),
              profileTiles("Help"),
              profileTiles("Support"),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Sign Out",
                  style: TextStyle(
                    color: Color.fromRGBO(250, 54, 54, 1),
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

Widget profilePhoto(String imagePath, double height, width) {
  return ClipOval(
    child: Image.asset(
      fit: BoxFit.cover,
      imagePath,
      height: height,
      width: width,
    ),
  );
}

Widget profileInfoContainer(
  VoidCallback onPress,
  String name,
  email,
  dob,
) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: primaryTextColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                email,
                style: const TextStyle(color: lightTextColor),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                dob,
                style: const TextStyle(color: lightTextColor),
              ),
            ],
          ),
        ),
        TextButton(
            onPressed: onPress,
            child: const Text(
              "Edit",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w800,
              ),
            ))
      ],
    ),
  );
}

Widget profileTiles(String name) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(12, 4, 10, 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: primaryTextColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
