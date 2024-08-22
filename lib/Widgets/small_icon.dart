import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.icon,
      required this.func,
      this.imagePath,
      this.color,
      this.height,
      this.width,
      this.iconColor});
  final IconData? icon;
  final String? imagePath;
  final VoidCallback func;
  final Color? color;
  final Color? iconColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipOval(
              child: imagePath != null
                  ? Image.asset(
                      imagePath!,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      icon,
                      size: 25,
                      color: iconColor,
                    )),
        ),
      ),
    );
  }
}
