import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  late String imagePath = '';
  late double width = 0;

  ImageWidget({required this.imagePath, required this.width});

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.contain,
      width: width,
      image: AssetImage(imagePath),
    );
  }
}
