import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../controllers/order_controller.dart';
import 'custom_squared_button.dart';

class BottomCardWidget extends ConsumerWidget {
  final Function()? onPressed;
  final bool addButton;
  const BottomCardWidget({
    super.key,
    this.onPressed,
    this.addButton = false
  });



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final orderState = ref.watch(orderController);
    final orderNotifier = ref.watch(orderController.notifier);

    return Container(
      width: width,
      decoration: BoxDecoration(
          color: cardColor2(!theme),
          boxShadow: [
            BoxShadow(
                color: kDarkAccent.withOpacity(.2),
                spreadRadius: 1.0,
                blurRadius: 1.0
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(languages[language]!["store"]!, style: kCustomTextStyle.copyWith(
                    color: grayTextColor(theme), fontSize: 14.w
                ),),

                Row(
                  spacing: 5,
                  children: [
                    Text("İZMİR BORNOVA", style: kTitleTextStyle.copyWith(
                        color: reverseTextColor(theme), fontSize: 16.w
                    ),),
                    Icon(CupertinoIcons.chevron_down, color: reverseTextColor(theme), size: 17.w,)
                  ],
                )
              ],
            ),

            Row(
              spacing: 10,
              children: [
                if(addButton) CustomSquaredButton(
                 // enableBorder: true,
                  borderRadius: 7,
                  width: 70.w,
                  height: 35.w,
                  color: kPrimaryOrange,
                  //borderColor: reverseTextColor(theme),
                  textStyle: kTitleTextStyle.copyWith(color: reverseTextColor(theme), fontSize: 14.w),
                  iconSize: 20.w,
                  title: languages[language]!["add_product"]!,
                  onPressed: () {
                    if(onPressed != null) {
                      onPressed!();
                    }
                  },
                ),
                CustomSquaredButton(
                  enableBorder: true,
                  borderRadius: 7,
                  width: 70.w,
                  height: 35.w,
                  color: cardColor2(!theme),
                  borderColor: reverseTextColor(theme),
                  textStyle: kTitleTextStyle.copyWith(color: reverseTextColor(theme), fontSize: 14.w),
                  icon: "bag",
                  iconSize: 20.w,
                  title: orderState.basket.length.toString(),
                  onPressed: () {
                    if(onPressed != null) {
                      onPressed!();
                    }
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
