import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/controllers/order_controller.dart';
import 'package:iycoffee/widgets/app_widgets/custom_squared_button.dart';
import 'package:iycoffee/widgets/app_widgets/warning_info_widget.dart';

import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../widgets/app_widgets/customizable_button_widget.dart';
import '../../widgets/cup_widget.dart';
import '../../widgets/favorite_button_widget.dart';
import '../../widgets/shop_widgets/product_basket_widget.dart';

class CardView extends ConsumerWidget {
  CardView({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final orderState = ref.watch(orderController);
    final orderNotifier = ref.watch(orderController.notifier);
    

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
        if(orderState.basket.isNotEmpty) Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            scrollDirection: Axis.vertical,
            itemCount: orderState.basket.length,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) => BasketProductWidget(
              basketModel: orderState.basket[index],
              onPressed: () {

            },),
          ),
        )
        else const Center(child: NoProductFound()),

        Container(
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
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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


