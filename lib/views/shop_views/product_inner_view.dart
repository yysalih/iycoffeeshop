import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/constants/snackbars.dart';
import 'package:iycoffee/repos/product_repository.dart';
import 'package:iycoffee/widgets/app_widgets/back_button_widget.dart';
import 'package:iycoffee/widgets/app_widgets/warning_info_widget.dart';
import 'package:iycoffee/widgets/cup_widget.dart';
import 'package:iycoffee/widgets/favorite_button_widget.dart';

import '../../constants/app_constants.dart';
import '../../constants/providers.dart';
import '../../controllers/order_controller.dart';
import '../../controllers/product_controller.dart';
import '../../repos/user_repository.dart';
import '../../widgets/app_widgets/customizable_button_widget.dart';

class ProductInnerView extends ConsumerWidget {
  final String uid;
  const ProductInnerView({super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final productProvider = ref.watch(productStreamProvider(uid));

    final productNotifier = ref.watch(productController.notifier);

    final userProvider = ref.watch(userStreamProvider(currentUserUid));

    final orderNotifier = ref.watch(orderController.notifier);
    final orderState = ref.watch(orderController);

    return Scaffold(
      backgroundColor: reverseBackgroundColor(theme),
      body: productProvider.when(
        data: (product) => SafeArea(
          child: userProvider.when(
            data: (user) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      BackButtonWidget(buttonColor: backGroundColor(theme), iconColor: backGroundColor(!theme),),
                      SizedBox(height: 10.h,),
                      Center(child: CupWidget(
                        isPositioned: false,
                        cupSize: 170.w,
                        logoSize: 115.w,
                        left: 30.w,
                        top: 140.h,
                      )),
                    ],
                  ),
                ),
                Container(
                  width: width, height: height * .5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
                    color: backGroundColor(theme),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(languages[language]![uid]!, style: kTitleTextStyle.copyWith(
                                    color: textColor(theme), fontSize: 20
                                ),),
                                CustomizableElevatedButton(onPressed: () {
                                  productNotifier.addFavoriteProduct(productUid: product.uid!,
                                      userFavorites: user.favorites!);
                                }, icon: user.favorites!.contains(product.uid!) ?
                                Icons.favorite : Icons.favorite_border,),
                              ],
                            ),

                            Row(
                              children: [
                                for(int i = 0; i < 4; i++)
                                  const Padding(
                                    padding: EdgeInsets.only(right: 0.0),
                                    child: Icon(Icons.star, color: Colors.orangeAccent,),
                                  ),
                                SizedBox(width: 10.w,),
                                Text("4.3", style: kCustomTextStyle.copyWith(
                                    color: textColor(theme)
                                ),)
                              ],
                            ),
                            SizedBox(height: 20.h,),
                            Text(product.description!, style: kCustomTextStyle.copyWith(
                                color: textColor(theme)
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                            color: backGroundColor(theme),
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
                              CustomizableButton(
                                width: width * .35, height: 45.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(product.price!.toString(), style: kCustomTextStyle.copyWith(
                                        fontWeight: FontWeight.bold
                                    ),),
                                    const Text("   |   ", style: kCustomTextStyle,),
                                    const Icon(Icons.shopping_cart_outlined,
                                      size: 17,
                                      color: Colors.white,),
                                    if(orderState.basket.where((element) =>
                                    element.productUid == product.uid!,).toList().isNotEmpty) ...[
                                      SizedBox(width: 5.w,),
                                      Text(orderState.basket.where((element) =>
                                      element.productUid == product.uid!,).toList().first.piece.toString(),
                                          style: kCustomTextStyle),
                                    ]
                                  ],
                                ),
                                onPressed: () {
                                  orderNotifier.addProduct(product, 1);
                                  showSnackbar(context: context, title: languages[language]!["success_adding_in_basket"]!);
                                },
                              ),
                              CustomizableButton(
                                width: width * .35, height: 45.h,
                                child: Text(languages[language]!["order"]!, style: kCustomTextStyle,),
                                onPressed: () {
                                  orderNotifier.addProduct(product, 1);
                                  orderNotifier.createOrder(context: context,
                                      errorTitle: languages[language]!["error_creating_order"]!,
                                      successTitle: languages[language]!["success_creating_order"]!,
                                  );
                                  orderNotifier.clearBasket();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            loading: () => loadingWidget(),
            error: (error, stackTrace) => const NoProductFound(),
          ),
        ),
        loading: () => loadingWidget(),
        error: (error, stackTrace) => const NoProductFound(),
      ),
    );
  }
}


