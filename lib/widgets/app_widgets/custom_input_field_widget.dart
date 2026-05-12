import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_constants.dart';

class CustomInputField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextInputType? textInputType;
  final IconData? icon;
  final IconData icon2;
  final double? height;
  final int maxLine;
  final bool isPassword;
  final bool isIconImage;
  final bool isSecured;
  final bool hasTitle;
  final double borderRadius;
  final bool isEnable;
  final bool hasSuffix;
  final bool hasLabel;
  final bool isHighlighted;
  final Function()? onHidePressed;
  final bool hasIcon;
  final TextEditingController controller;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String value)? onChanged;
  final double? width;
  final double titleSize;
  final Color titleColor;
  final List<TextInputFormatter>? inputFormatters;
  final FontWeight titleWeight;
  final Color backgroundColor;
  final Color borderColor;

  const CustomInputField({super.key,
    required this.title,
    required this.hintText,
    this.textInputType,
    this.icon,
    this.icon2 = Icons.paste,
    this.height,
    this.maxLine = 1,
    this.isPassword = false,
    this.isIconImage = false,
    this.hasLabel = false,
    this.isSecured = false,
    this.hasTitle = true,
    this.borderRadius = 10,
    this.isEnable = true,
    this.hasSuffix = false,
    this.isHighlighted = false,
    this.onHidePressed,
    this.onEditingComplete,
    this.hasIcon = false,
    required this.controller,
    this.onTap,
    this.onChanged,
    this.width,
    this.inputFormatters,
    this.titleSize = 12,
    this.titleWeight = FontWeight.bold,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.white,
    this.borderColor = kLightGrey,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {

  @override
  Widget build(BuildContext context) {
    final border = (widget.isHighlighted && widget.controller.text.isEmpty ? kBorderInputDecoration : kStrokedInputDecoration);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.hasTitle) ...[
          Text(widget.title, style: kTitleTextStyle.copyWith(color: widget.titleColor,
              fontSize: widget.titleSize, fontWeight: widget.titleWeight),),
          const SizedBox(height: 5,),
        ],
        SizedBox(
          height: widget.height, width: widget.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Material(
              color: widget.backgroundColor,
              child: TextField(
                autofocus: false,
                maxLines: widget.maxLine,
                controller: widget.controller,
                inputFormatters: widget.inputFormatters,
                enabled: widget.isEnable,
                keyboardType: widget.textInputType,
                style: kCustomTextStyle.copyWith(fontSize: kIsWeb ? 13 : 13.w, color: kBlack),
                onChanged: widget.onChanged,
                obscureText: widget.isSecured,
                onEditingComplete: widget.onEditingComplete,
                decoration: border.copyWith(
                  border: border.border!.copyWith(borderSide: border.border!.borderSide.copyWith(color: widget.borderColor)),
                  focusedBorder: border.focusedBorder!.copyWith(borderSide: border.focusedBorder!.borderSide.copyWith(color: widget.borderColor)),
                  enabledBorder: border.enabledBorder!.copyWith(borderSide: border.enabledBorder!.borderSide.copyWith(color: widget.borderColor)),
                  disabledBorder: border.disabledBorder!.copyWith(borderSide: border.disabledBorder!.borderSide.copyWith(color: widget.borderColor)),
                  errorBorder: border.errorBorder!.copyWith(borderSide: border.errorBorder!.borderSide.copyWith(color: widget.borderColor)),
                  focusedErrorBorder: border.focusedErrorBorder!.copyWith(borderSide: border.focusedErrorBorder!.borderSide.copyWith(color: widget.borderColor)),


                  suffixIcon: widget.hasSuffix ?
                  IconButton(
                    icon: Icon(widget.icon2, color: Colors.grey,),
                    onPressed: widget.onTap,
                  ) :
                  widget.isPassword ?
                  IconButton(
                    icon: Icon(widget.isSecured ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill, color: Colors.grey,),
                    onPressed: widget.onHidePressed,
                    iconSize: kIsWeb ? 18 : 20.w,
                  ) : null,

                  contentPadding: const EdgeInsets.all(10),
                  hintText: widget.hintText,
                  hintStyle: kCustomTextStyle.copyWith(fontSize: kIsWeb ? 13 : 13.w, color: Colors.grey),
                  prefixIcon: widget.hasIcon ? !widget.isIconImage ? Icon(widget.icon, color: kLightGrey,)
                      : Padding(padding: const EdgeInsets.all(kIsWeb ? 12 : 12),child: Image.asset("assets/icons/search.png", width: kIsWeb ? 15 : 10.w,)) : null,
                  label: !widget.hasLabel ? null : Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(widget.title, style: kCustomTextStyle.copyWith(fontSize: kIsWeb ? 10 : 14.w, color: kLightGrey),),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


Widget customInputField({
  required String title,
  required String hintText,
  TextInputType? textInputType,
  IconData? icon,
  IconData icon2 = Icons.paste,
  double? height,
  int maxLine = 1,
  bool isPassword = false,
  bool isSecured = false,
  bool hasTitle = true,
  double borderRadius = 10,
  bool isEnable = true,
  bool hasSuffix = false,
  bool isHighlighted = false,
  Function()? onHidePressed,
  bool hasIcon = true,
  required TextEditingController controller,
  Function()? onTap,
  Function(String value)? onChanged,
  double? width,
  List<TextInputFormatter>? inputFormatters,
  }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(hasTitle) ...[
        Text(title, style: kTitleTextStyle.copyWith(color: kWhite,fontSize: 15.w),),
        const SizedBox(height: 5,),
      ],
      SizedBox(
        height: height, width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Material(
            color: kLightBlack,
            child: TextField(
              maxLines: maxLine,
              controller: controller,
              inputFormatters: inputFormatters,
              enabled: isEnable,
              keyboardType: textInputType,
              style: kCustomTextStyle.copyWith(fontSize: 13.w),
              onChanged: onChanged,
              obscureText: isSecured,
              decoration: (isHighlighted && controller.text.isEmpty ? kBorderInputDecoration :kInputDecoration).copyWith(
                suffixIcon: hasSuffix ?
                    IconButton(
                      icon: Icon(icon2, color: Colors.grey,),
                      onPressed: onTap,
                    )
                    : isPassword ? IconButton(
                  icon: Icon(isSecured ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill, color: Colors.grey,),
                  onPressed: onHidePressed,
                  iconSize: 20.w,
                ) : null,
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                hintStyle: const TextStyle(color: kHintColor),
                prefixIcon: hasIcon ? Icon(icon, color: kHintColor,) : null,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget customInputField2({
  required BuildContext context,
  required FocusNode emojiFocusNode,
  required String title,
  required String hintText,
  required IconData icon,
  bool isPassword = false,
  bool isSecured = false,
  bool hasTitle = true,
  double borderRadius = 25,
  bool isEnable = true,
  bool hasIcon = true,
  bool hasPrefix = false,
  bool hasEmoji = false,
  bool hasGallery = false,
  required TextEditingController controller,
  required Function() onTap,
  required Function() onGalleryPressed,
  required Function() onEmojiPressed,
  Function()? onHidePressed,
  required Function(String value) onChanged,
  TextInputType textInputType = TextInputType.text,
  Color backgroundColor = kLightBlack,
  int? maxLines = 5,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(hasTitle) ...[
        Text(title, style: kCustomTextStyle.copyWith(fontWeight: FontWeight.bold),),
        const SizedBox(height: 5,)
      ],

      ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Material(
          color: backgroundColor,
          child: TextField(
            controller: controller,
            enabled: isEnable,
            style: kCustomTextStyle.copyWith(color: kBlack),
            onChanged: onChanged,
            onTap: onTap,
            keyboardType: textInputType,
            textInputAction: TextInputAction.newline,
            minLines: 1,
            maxLines: maxLines,
            decoration: kInputDecoration.copyWith(
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: kLightGrey, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,

              suffixIcon: isPassword ? IconButton(
                icon: Icon(isSecured ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill, color: Colors.grey,),
                onPressed: onHidePressed,
                iconSize: kIsWeb ? 20 : 20.w,
              ) : hasEmoji ? IconButton(
                onPressed: onEmojiPressed,
                icon: Icon(Icons.emoji_emotions, color: Colors.grey, size: kIsWeb ? 20 : 20.w,),
                iconSize: kIsWeb ? 20: 20.w,
              ) : null,
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: hasIcon ? hasPrefix ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(hasGallery)IconButton(
                    icon: Icon(icon, color: Colors.grey,),
                    onPressed: onGalleryPressed,
                    iconSize: kIsWeb ? 20 : 20.w,
                  ),

                ],
              )
                  : Icon(icon, color: Colors.grey,) : null,
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
