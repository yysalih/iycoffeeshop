import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/controllers/order_controller.dart';
import 'package:iycoffee/models/basket_model.dart';
import 'package:iycoffee/views/shop_views/product_inner_view.dart';

import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../cup_widget.dart';
import '../favorite_button_widget.dart';

class BasketProductWidget extends ConsumerWidget {

  final BasketModel basketModel;
  final Function() onPressed;

  const BasketProductWidget({super.key,
    required this.basketModel,
    required this.onPressed,
  });



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final orderNotifier = ref.watch(orderController.notifier);
    final orderState = ref.watch(orderController);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 35.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              width: width, height: height * .2,
              decoration: BoxDecoration(
                color: textColor(!theme),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context, routeToView(ProductInnerView(uid: basketModel.productUid!)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(languages[language]![basketModel.productUid]!, style: kTitleTextStyle.copyWith(
                                color: Colors.white, fontSize: 20
                            ), ),
                              SizedBox(height: 2.h,),
                              Text("${basketModel.totalPrice} TL", style: kCustomTextStyle.copyWith(
                                color: Colors.grey.shade300, fontSize: 15,
                              ),),

                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Transform.scale(
                              scale: .7,
                              child: CustomizableElevatedButton(
                                iconColor: textColor(!theme),
                                backgroundColor: buttonColor(theme),
                                icon: Icons.remove,
                                iconSize: 30,
                                elevatedPadding: 0,
                                onPressed: () {
                                  orderNotifier.changePiece(basketModel, isIncrement: false);
                                },
                              ),
                            ),
                            Text(orderState.basket.where(
                                  (element) => element.uid! == basketModel.uid!,)
                                .toList().first.piece.toString(),
                            style: kTitleTextStyle.copyWith(
                              color: Colors.grey.shade300
                            )),
                            Transform.scale(
                              scale: .7,
                              child: CustomizableElevatedButton(
                                iconColor: textColor(!theme),
                                backgroundColor: buttonColor(theme),
                                icon: Icons.add,
                                iconSize: 30,
                                elevatedPadding: 0,
                                onPressed: () {
                                  orderNotifier.changePiece(basketModel, isIncrement: true);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )

          ),
          Positioned(
            bottom: 0, left: 10,
            child: CupWidget(
              isPositioned: false,
              cupSize: 130.w,
              top: 110,
              left: 20,
              logoSize: 90,
            ),
          ),

        ],
      ),
    );
  }
}