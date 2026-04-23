import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';

class CustomSquaredButton extends ConsumerWidget {
  final double? width;
  final double height;
  final double iconSize;
  final double borderRadius;
  final double iconPadding;
  final String icon;
  final Function() onPressed;
  final Color color;
  final Color? iconColor;
  final Color borderColor;
  final bool enableBorder;
  final String title;
  final TextStyle textStyle;
  final IconData? iconData;

  const CustomSquaredButton({super.key,
    this.width = 60,
    this.height = 60,
    this.iconSize = 50,
    this.borderRadius = 15,
    this.iconPadding = 10,
    this.icon = "",
    required this.onPressed,
    this.color = kPrimaryOrange,
    this.iconColor = Colors.white,
    this.borderColor = kOrangeDark,
    this.enableBorder = false,
    this.title = "",
    this.textStyle = kCustomTextStyle,
    this.iconData
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width, height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        border: !enableBorder ? null : Border.all(width: 1.5, color: borderColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialButton(
          onPressed: onPressed,
          child: title.isNotEmpty ? (icon.isNotEmpty || iconData != null)
              ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  iconData != null ? Icon(iconData, size: iconSize, color: iconColor,) : Image.asset("assets/icons/$icon.png", width: iconSize, color: iconColor,),
                  Text(title, style: textStyle,)
                ]
              )
              :
          Text(title, style: textStyle,) :
          iconData != null ? Icon(iconData, size: iconSize, color: iconColor,) : Transform.scale(scale: iconPadding, child: Image.asset("assets/icons/$icon.png", width: iconSize, color: iconColor,)),
        ),
      ),
    );
  }
}


class CustomSquaredButton2 extends ConsumerWidget {
  final double width;
  final double height;
  final double iconSize;
  final String icon;
  final String title;
  final Function() onPressed;
  final Color color;
  final Color? iconColor;
  final bool isSelected;

  const CustomSquaredButton2({super.key,
    this.width = 150,
    this.height = 60,
    this.iconSize = 20,
    required this.icon,
    required this.onPressed,
    required this.title,
    this.color = kPrimaryOrange,
    this.iconColor = Colors.white,
    this.isSelected = false
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageStateProvider);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(

        color: color,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: Row(
              spacing: 5,
              children: [
                Image.asset("assets/icons/$icon.png", width: iconSize, color: iconColor,),
                Text(languages[language]![title]!, style: kCustomTextStyle.copyWith(
                  fontSize: kIsWeb ? 11 : 11.w
                ),),
                if(isSelected) Icon(Icons.check_circle_rounded, color: kGreen, size: kIsWeb ? 15 : 15.w,)
              ],
            ),
          ),
      ),
    );
  }
}
