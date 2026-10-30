import 'package:flutter/material.dart';

class CustomBookImageLoadingIndicator extends StatelessWidget {
  const CustomBookImageLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child:  Container(
          color: Colors.grey[50],
        ),
      ),
    );
  }
}