import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  final Color dotColor;
  const Dots({
    super.key,
    required this.dotColor
  });

  @override
  Widget build(BuildContext context) {
    double size = 4;

    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: dotColor,
          shape: BoxShape.circle
        )
      )
    );
  }
}