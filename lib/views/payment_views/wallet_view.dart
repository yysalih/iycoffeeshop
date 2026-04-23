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
import '../../widgets/card_widgets/menu_card_widget.dart';
import '../../widgets/cup_widget.dart';
import '../../widgets/favorite_button_widget.dart';
import '../../widgets/shop_widgets/product_basket_widget.dart';
import '../../widgets/wallet_widgets/wallet_widget.dart';

class WalletView extends ConsumerWidget {
  WalletView({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final orderState = ref.watch(orderController);
    final orderNotifier = ref.watch(orderController.notifier);
    

    return Stack(

      children: [
        Container(
          height: height,
          width: width,
          color: kLightBlack2,
        ),
        Positioned(
          top: height * -.275,
          right: -35,
          child: Image.asset("assets/icons/rabbit2.png", width: width * .65, color: kOrangeSubtle.withOpacity(.15),),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10, top: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(languages[language]!["payment"]!, style: kTitleTextStyle.copyWith(color: reverseTextColor(theme), fontSize: 20.w),),
              IconButton(
                iconSize: 30.w,
                icon: Icon(CupertinoIcons.person_alt_circle_fill, color: reverseTextColor(theme),),
                onPressed: () {

                },
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              Container(
                width: width, height: height * .82,
                color: Colors.white,
                child: Column(
                  spacing: 20,
                  children: [
                    Column(

                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {

                              },
                              child: Text(languages[language]!["menu2"]!, style: kTitleTextStyle.copyWith(
                                  fontSize: 16.w, color: kPrimaryOrange
                                )
                              ),
                            ),
                            GestureDetector(
                              onTap: () {

                              },
                              child: Text(languages[language]!["my_orders"]!, style: kTitleTextStyle.copyWith(
                                  fontSize: 16.w, color: grayTextColor2(theme)
                              )
                              ),
                            ),
                            GestureDetector(
                              onTap: () {

                              },
                              child: Text(languages[language]!["my_favorite"]!, style: kTitleTextStyle.copyWith(
                                  fontSize: 16.w, color: grayTextColor2(theme)
                              )
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 3,),
                        Container(width: width * .9, height: 1, color: Colors.grey.shade300,),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        spacing: 15,
                        children: [
                          const WalletWidget(),


                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}


