import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_constants.dart';

Widget customInputField({
  required String title,
  required String hintText,
  required IconData icon,
  IconData prefixIcon = Icons.close,
  bool isSecured = false,
  bool hasTitle = true,
  double borderRadius = 10,
  bool isEnable = true,
  bool hasPrefixIcon = true,
  bool hasSuffixIcon = false,
  required TextEditingController controller,
  required Function() onTap,
  required Function(String value) onChanged,
  required bool theme
  }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(hasTitle) ...[
        Text(title, style: kTitleTextStyle.copyWith(color: textColor(theme),),),
        SizedBox(height: 3.h,),
      ],
      ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Material(
          color: cardColor(theme),
          child: TextField(
            controller: controller,
            enabled: isEnable,
            style: kCustomTextStyle.copyWith(color: textColor(theme)),
            onChanged: onChanged,
            onTap: onTap,
            decoration: kInputDecoration.copyWith(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: TextStyle(color: textColor(theme)),
              prefixIcon: hasPrefixIcon ? Icon(icon, color: textColor(theme),) : null,
              suffixIcon: hasSuffixIcon ? Icon(prefixIcon, color: textColor(theme),) : null,
            ),
          ),
        ),
      ),
    ],
  );
}


Widget customRichInputField({
  required String title,
  required String hintText,
  required IconData icon,
  bool isSecured = false,
  bool hasTitle = true,
  double borderRadius = 10,
  bool isEnable = true,
  required TextEditingController controller,
  int maxLines = 5,
  double bottom = 70,
  required Function() onTap,
  }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(hasTitle) ...[
        Text(title, style: kTitleTextStyle.copyWith(color: kWhite),),
        SizedBox(height: 3.h,),
      ],
      ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Material(
          color: kLightBlack,
          child: TextField(
            controller: controller,
            enabled: isEnable,
            style: kCustomTextStyle,
            onTap: onTap,
            decoration: kInputDecoration.copyWith(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: const TextStyle(color: kHintColor),
              prefixIcon: Padding(
                padding: EdgeInsets.only(bottom: bottom),
                child: Icon(icon, color: kHintColor,),
              ),
            ),
            maxLines: maxLines,
          ),
        ),
      ),
    ],
  );
}
