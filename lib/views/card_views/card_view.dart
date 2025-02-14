import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../widgets/app_widgets/customizable_button_widget.dart';
import '../../widgets/cup_widget.dart';
import '../../widgets/favorite_button_widget.dart';
import '../../widgets/shop_widgets/product_basket_widget.dart';

class CardView extends ConsumerWidget {
  CardView({super.key});

  final List products = ["coffee", "tea", "food"];
  final List coffees = ["latte", "americano", "mocha", "espresso"];
  final List prices = ["30.0", "25.0", "45.0", "20.0"];
  final List ratings = ["4.7", "4.3", "5.0", "3.5"];


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(languages[language]!["basket"]!, style: kTitleTextStyle.copyWith(
            color: textColor(theme), fontSize: 20
          ),),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            scrollDirection: Axis.vertical,
            itemCount: coffees.length,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) => BasketProductWidget(
              name: coffees[index],
              price: prices[index],
              onPressed: () {

            },),
          ),
        ),

        Container(
          width: width,
          decoration: BoxDecoration(
              color: textColor(!theme),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: kDarkAccent.withOpacity(.2),
                    spreadRadius: 1.0,
                    blurRadius: 1.0
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(languages[language]!["total"]!, style: kCustomTextStyle.copyWith(
                      color: Colors.white
                    ),),
                    Text("120 TL", style: kTitleTextStyle.copyWith(
                        color: Colors.white
                    ),),
                  ],
                ),
                CustomizableButton(
                  color: buttonColor(theme),
                  width: width * .35, height: 45.h,
                  child: Text(languages[language]!["order"]!, style: kCustomTextStyle),
                  onPressed: () {

                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


