import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class CustomizableButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final double width;
  final double height;
  final Function() onPressed;
  final bool isBasketEmpty;
  const CustomizableButton({super.key,
    required this.child,
    required this.width,
    required this.height,
    required this.onPressed,
    this.color = kDarkSecondary,
    this.borderRadius = 5,
    this.isBasketEmpty = false,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width, height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialButton(
          onPressed: isBasketEmpty ? null : onPressed,
          child: child,
        ),
      ),
    );
  }
}