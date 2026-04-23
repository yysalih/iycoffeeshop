import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/controllers/order_controller.dart';
import 'package:iycoffee/repos/product_repository.dart';
import 'package:iycoffee/widgets/app_widgets/custom_circle_button.dart';
import 'package:iycoffee/widgets/app_widgets/custom_squared_button.dart';
import 'package:iycoffee/widgets/shop_widgets/drink_card_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../repos/user_repository.dart';
import '../../widgets/app_widgets/card_bottom_widget.dart';
import '../../widgets/app_widgets/warning_info_widget.dart';
import '../../widgets/card_widgets/menu_card_widget.dart';
import '../../widgets/wallet_widgets/wallet_widget.dart';

class DrinkView extends ConsumerWidget {
  final String uid;
  const DrinkView({super.key,
    required this.uid
  });



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final orderState = ref.watch(orderController);
    final orderNotifier = ref.watch(orderController.notifier);

    final drinkProvider = ref.watch(drinkStreamProvider(uid));
    final userProvider = ref.watch(userStreamProvider(currentUserUid));


    return drinkProvider.when(
      data: (drink) => Stack(

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
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,

                  children: [
                    IconButton(
                      icon: const Icon(CupertinoIcons.chevron_back, color: Colors.white,),
                      onPressed: () => context.pop(),
                    ),
                    Text(languages[language]![drink.name]!, style: kTitleTextStyle.copyWith(color: reverseTextColor(theme), fontSize: 20.w),),

                  ],
                ),
                userProvider.when(
                  data: (user) => IconButton(
                    icon: Icon(CupertinoIcons.heart, color: reverseTextColor(theme),),
                    onPressed: () {

                    },
                  ),
                  error: (error, stackTrace) => const SizedBox(),
                  loading: () => const SizedBox(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  width: width, height: height * .75,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Column(

                          spacing: 20,
                          children: [
                            const SizedBox.shrink(),
                            DrinkCardWidget(
                              productModel: drink,
                              scale: 2,
                              fontSize: 16.w,
                              padding: 0,
                              onPressed: () {

                              },
                            ),
                            Text(languages[language]![drink.description]!, style: kCustomTextStyle.copyWith(
                              color: textColor(theme),
                            ), textAlign: TextAlign.center,),

                          ],
                        ),
                        CustomSquaredButton(
                          // enableBorder: true,
                          borderRadius: 20,
                          width: width,
                          height: 40.w,
                          color: kPrimaryOrange,
                          //borderColor: reverseTextColor(theme),
                          textStyle: kTitleTextStyle.copyWith(color: reverseTextColor(theme), fontSize: 14.w),
                          iconSize: 20.w,
                          title: languages[language]!["add_product"]!,
                          onPressed: () {
                            orderNotifier.addProductInBasket(drink, 1);

                          },
                        ),
                      ],
                    ),
                  ),
                ),
                BottomCardWidget(
                  addButton: false,
                  onPressed: () {
                    orderNotifier.addProductInBasket(drink, 1);
                  },
                ),
              ],
            ),
          )
        ],
      ),
      error: (error, stackTrace) => Container(),
      loading: () => loadingWidget(),
    );
  }
}



