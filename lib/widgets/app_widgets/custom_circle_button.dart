
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_constants.dart';

class CustomCircleButton extends ConsumerWidget {
  final double padding;
  final IconData icon;
  final double iconSize;
  final Function() onPressed;
  final Color backgroundColor;
  final Color iconColor;

  const CustomCircleButton({super.key,
    this.padding = 10,
    this.iconSize = 25,
    required this.icon,
    this.backgroundColor = kLightBlack,
    this.iconColor = Colors.white,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(padding)
      ),
      child: Icon(icon, color: iconColor, size: iconSize),
    );
  }
}
