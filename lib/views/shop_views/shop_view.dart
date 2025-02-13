import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/widgets/shop_widgets/product_card_widget.dart';

import '../../constants/providers.dart';

class ShopView extends ConsumerWidget {
  ShopView({super.key});

  final List products = ["coffee", "tea", "food"];
  final List coffees = ["latte", "americano", "mocha", "espresso"];
  final List prices = ["30.0", "25.0", "45.0", "20.0"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(  // Wrap everything in SingleChildScrollView
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(100)),
              color: reverseBackgroundColor(theme),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        color: backGroundColor(theme),
                        width: 250.w,
                      ),
                      CircleAvatar(
                        radius: 30.h,
                        backgroundColor: buttonColor(theme),
                        child: Image.asset("assets/icons/photo.png", width: 40.w),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    languages[language]!["the_best_int_town"]!,
                    style: kTitleTextStyle.copyWith(
                      color: backGroundColor(theme),
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < products.length; i++)
                        filterButtons(language, theme, products[i], () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              languages[language]!["most_popular"]!,
              style: kTitleTextStyle.copyWith(
                color: textColor(theme),
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 40.h),

          // Horizontal ListView for coffees
          SizedBox(
            height: 200.h,  // Set a fixed height to make it scrollable horizontally
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20.0),
              scrollDirection: Axis.horizontal,
              itemCount: coffees.length,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) => ProductCardWidget(
                name: languages[language]![coffees[index]]!,
                price: "${prices[index]} TRY",
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              languages[language]!["all_products"]!,
              style: kTitleTextStyle.copyWith(
                color: textColor(theme),
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            height: 200.h,  // Set a fixed height to make it scrollable horizontally
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20.0),
              scrollDirection: Axis.horizontal,
              itemCount: coffees.length,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) => ProductCardWidget(
                name: languages[language]![coffees.reversed.toList()[index]]!,
                price: "${prices[index]} TRY",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterButtons(String language, bool theme, String text, Function() onPressed) => Container(
    height: 40.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: buttonColor(theme)
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: MaterialButton(

        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(languages[language]![text]!, style: kCustomTextStyle.copyWith(
            color: cardColor(theme), fontSize: 17
          ),),
        ),
      ),
    ),
  );
}
