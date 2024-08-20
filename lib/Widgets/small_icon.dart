import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.icon,
      required this.func,
      this.imagePath,
      this.color,
      this.iconColor});
  final IconData? icon;
  final String? imagePath;
  final VoidCallback func;
  final Color? color;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipOval(
              child: imagePath != null
                  ? Image.asset(
                      imagePath!,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Icon(
                        icon,
                        size: 30,
                        color: iconColor,
                      ),
                    )),
        ),
      ),
    );
  }
}
