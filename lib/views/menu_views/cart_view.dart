
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/repos/cake_repository.dart';
import 'package:iycoffee/widgets/app_widgets/app_status_widget.dart';
import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../controllers/order_controller.dart';
import '../../repos/product_repository.dart' show drinkStreamProvider;
import '../../repos/user_repository.dart';
import '../../widgets/app_widgets/card_bottom_widget.dart';
import '../../widgets/app_widgets/custom_squared_button.dart';
import '../../widgets/card_widgets/cart_widget.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final orderState = ref.watch(orderController);
    final orderNotifier = ref.watch(orderController.notifier);

    final userProvider = ref.watch(userStreamProvider(FirebaseAuth.instance.currentUser!.uid));
    

    final total = orderState.cart.fold(0.0, (previousValue, element) => previousValue + (element.totalPrice!));

    return userProvider.when(
      data: (user) => Stack(

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
            padding: const EdgeInsets.only(left: 0.0, top: 35),
            child: Row(
              spacing: 10,
              children: [
                IconButton(
                  icon: const Icon(CupertinoIcons.chevron_back, color: Colors.white,),
                  onPressed: () => context.pop(),
                ),
                Text(languages[language]!["my_cart"]!, style: kTitleTextStyle.copyWith(color: reverseTextColor(theme),
                    fontSize: 17.w),),
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
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: orderState.cart.length,
                            padding: const EdgeInsets.all(15),

                            itemBuilder: (context, index) {
                              final cartItem = orderState.cart[index];
                              if(cartItem.type == "cake") {
                                final cakeProvider = ref.watch(cakeStreamProvider(cartItem.productUid!));
                                final cake = cakeProvider.value;
                                if(cake != null) {
                                  return CartWidget(
                                    model: cartItem,
                                    productUid: cartItem.productUid!,
                                    userFavorites: user.favorites!,
                                    isFav: user.favorites!.contains(cartItem.productUid),
                                    title: languages[language]![cake.name!]!,
                                    image: cake.image!,
                                    piece: cartItem.piece!,
                                  );
                                }

                              }
                              else if (cartItem.type == "drink") {
                                final drinkProvider = ref.watch(drinkStreamProvider(cartItem.productUid!));
                                final drink = drinkProvider.value;
                                if(drink != null) {
                                  return CartWidget(
                                    model: cartItem,
                                    productUid: cartItem.productUid!,
                                    userFavorites: user.favorites!,
                                    isFav: user.favorites!.contains(cartItem.productUid),
                                    title: languages[language]![drink.name!]!,
                                    image: drink.image!,
                                    piece: cartItem.piece!,
                                  );
                                }
                              }
                              return const SizedBox.shrink();
                            }
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("$total ₺", style: kTitleTextStyle.copyWith(
                              fontSize: 15.w, color: textColor(theme)),),
                            CustomSquaredButton(
                              // enableBorder: true,
                              borderRadius: 20,
                              width: width * .7,
                              height: 40.w,
                              color: kPrimaryOrange,
                              //borderColor: reverseTextColor(theme),
                              textStyle: kTitleTextStyle.copyWith(color: reverseTextColor(theme), fontSize: 15.w),
                              iconSize: 20.w,
                              title: languages[language]!["complete_order"]!,
                              onPressed: () {
                                debugPrint("Total: $total");
                            
                                if(user.wallet! < total) {
                            
                                  showDialog(context: context, builder: (context) => CustomAlertDialog(
                                    title: languages[language]!["insufficient_balance"]!,
                                    description: languages[language]!["add_funds_to_wallet"]!,
                                    image: "rabbit2",
                                    iconColor: kPrimaryOrange,
                                    onPressed: () {
                                      context.pop();
                                      context.push("/wallet");
                                    },
                                  ));
                            
                                }
                                else {
                                  orderNotifier.createOrder(
                                    context: context,
                                    errorTitle: languages[language]!["order_creation_failed"]!,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
                const BottomCardWidget(addButton: true,)
              ],
            ),
          )
        ],
      ),
      loading: () => const SizedBox.shrink(),
      error: (e, s) => const SizedBox.shrink(),
    );
  }
}


