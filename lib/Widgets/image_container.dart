import 'package:flutter/material.dart';

class ContainerWithImage extends StatelessWidget {
  const ContainerWithImage({super.key, required this.imagePath, required this.height, required this.width});
  final String imagePath;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        fit: BoxFit.cover,
        imagePath,
        height: height,
        width: width,
      ),
    );
  }
}
