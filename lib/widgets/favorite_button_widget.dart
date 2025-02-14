import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomizableElevatedButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double iconSize;
  final double elevatedPadding;
  final Function() onPressed;
  const CustomizableElevatedButton({super.key,
    required this.onPressed,
    this.icon = Icons.favorite,
    this.iconColor = Colors.redAccent,
    this.backgroundColor = Colors.white,
    this.iconSize = 25,
    this.elevatedPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.all(elevatedPadding),
          shape: const CircleBorder()
      ),
      child: Icon(icon, color: iconColor, size: iconSize,),
    );
  }
}
