import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/controllers/product_controller.dart';
import 'package:iycoffee/models/product_model.dart';
import 'package:iycoffee/repos/cake_repository.dart';
import 'package:iycoffee/repos/user_repository.dart';
import 'package:iycoffee/views/shop_views/product_inner_view.dart';
import 'package:iycoffee/widgets/app_widgets/custom_circle_button.dart';
import 'package:iycoffee/widgets/app_widgets/custom_squared_button.dart';
import 'package:iycoffee/widgets/app_widgets/warning_info_widget.dart';
import 'package:iycoffee/widgets/shop_widgets/cake_card_widget.dart';
import 'package:iycoffee/widgets/shop_widgets/product_card_widget.dart';

import '../../constants/providers.dart';
import '../../repos/breakfast_repository.dart';
import '../../repos/product_repository.dart';
import '../../widgets/shop_widgets/coffee_progress_painter.dart';
import '../../widgets/shop_widgets/drink_card_widget.dart';
import '../../widgets/shop_widgets/filter_button_widget.dart';

class ShopView extends ConsumerStatefulWidget {
  const ShopView({super.key});

  @override
  ConsumerState<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends ConsumerState<ShopView> {
  final List products = [
    "blueberry_cool_lime",
    "chocolate_chips_berry_frappuccino",
    "chocolate_frappuccino",
    "frappuccino",
    "green_tea_frappuccino"
    "peach_milkshake",
    "pistachio_chocolate_shake",
    "pistachio_frappuccino",
    "strawberry_churro_frappuccino",
    "strawberry_red_velvet_mocha"
  ];

  final List<double> prices = [150.0, 210.0, 190.0, 100.0, 150.0, 110.0, 290.0, 100.0, 150.0, 190.0];

  final images = [
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/drinks%2Fblueberry_cool_lime.png?alt=media&token=ed3312b1-0157-4d43-aa05-8f938babb19a",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/drinks%2Fchocolate_chips_berry_frappuccino.png?alt=media&token=5b0e2513-7597-468d-a164-ab3302a32ee5",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/drinks%2Fchocolate_frappuccino.png?alt=media&token=34c0a367-581c-44bd-b88c-5cd540114561",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/drinks%2Ffrappuccino.png?alt=media&token=400c37c4-defc-4a26-87c3-e830aeac31fa",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/drinks%2Fgreen_tea_frappuccino.png?alt=media&token=0b9ee5e6-233a-40cc-83dd-241deba1e6d9",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/drinks%2Fpeach_milkshake.png?alt=media&token=fa7d9042-9bd2-48d7-b394-aaf2b51fa307",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/drinks%2Fpistachio_chocolate_shake.png?alt=media&token=a07f3b8a-7b48-4318-a0be-3f517a68f64f",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/drinks%2Fpistachio_frappuccino.png?alt=media&token=6b93a23b-01be-436d-8658-2ec1f023172b",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/drinks%2Fstrawberry_churro_frappuccino.png?alt=media&token=28bd1339-2f65-4d21-9671-2e9923e7ca3b",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/drinks%2Fstrawberry_red_velvet_mocha.png?alt=media&token=0f6d2f98-33bd-4116-b43b-42f5bf766895"
  ];


  int count = 0;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    final userProvider = ref.watch(userStreamProvider(currentUserUid));
    final drinksProvider = ref.watch(drinksStreamProvider(""));
    final cakesProvider = ref.watch(cakesStreamProvider(""));
    final breakfastsProvider = ref.watch(breakfastsStreamProvider(""));



    final drinksNotifier = ref.watch(drinksController.notifier);

    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          color: kLightBlack2,
        ),
        Positioned(
          top: height * -.2,
          right: -35,
          child: Image.asset("assets/icons/rabbit2.png", width: width * .75, color: kOrangeSubtle.withOpacity(.15),),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10, top: 25),
          child: Column(
            spacing: 20,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Text(languages[language]!["hello"]!, style: kTitleTextStyle.copyWith(color: reverseTextColor(theme), fontSize: 25),),
                      Image.asset("assets/icons/rabbit.png", width: 20, color: Colors.white,),
                    ],
                  ),
                  IconButton(
                    iconSize: 30.w,
                    icon: Icon(CupertinoIcons.person_alt_circle_fill, color: reverseTextColor(theme),),
                    onPressed: () {

                    },
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _incerement();
                },
                child: CoffeeLoadBar(
                  current: count,
                  total: 6,
                  imagePath: 'assets/images/cup2.png',
                  theme: theme,
                ),
              )
            ],
          ),
        ),



        DraggableScrollableSheet(

          expand: true,
          initialChildSize: 0.65,
          minChildSize: 0.65,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  spacing: 20,
                  children: [
                    const SizedBox.shrink(),
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSquaredButton(
                          borderRadius: 20,
                          height: 40,
                          width: 150.w,
                          title: languages[language]!["join_now"]!,
                          textStyle: kTitleTextStyle.copyWith(color: Colors.white, fontSize: 15.w),
                          onPressed: () {
                            /*for(int i = 0; i < products.length; i++) {
                              drinksNotifier.createProduct(
                                title: products[i],
                                description: "${products[i]}_description",
                                category: "drink",
                                price: prices[i],
                                image: images[i]
                              );
                            }*/
                          },
                        ),
                        CustomSquaredButton(
                          borderRadius: 20,
                          height: 40,
                          width: 150.w,
                          color: kLightBlack2,
                          title: languages[language]!["login"]!,
                          textStyle: kTitleTextStyle.copyWith(color: Colors.white, fontSize: 15.w),
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        //const SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(languages[language]!["for_you"]!, style: kTitleTextStyle.copyWith(
                                fontSize: 17.w, color: kBrownLight
                              ),),
                              TextButton(
                                child: Row(
                                  spacing: 5,
                                  children: [
                                    Text(languages[language]!["all"]!, style: kTitleTextStyle.copyWith(
                                        fontSize: 14.w, color: kPrimaryOrange
                                    ),),
                                    Icon(CupertinoIcons.arrow_right, color: kPrimaryOrange, size: 12.w, fontWeight: FontWeight.bold,)
                                  ],
                                ),
                                onPressed: () {
                                  context.push("/drinks");
                                },
                              ),
                            ],
                          ),
                        ),
                        drinksProvider.when(
                          data: (drinks) => SizedBox(
                            height: 150.h,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(left: 20.0),
                              scrollDirection: Axis.horizontal,
                              itemCount: drinks.length,
                              clipBehavior: Clip.none,
                              itemBuilder: (context, index) => DrinkCardWidget(
                                onPressed: () {
                                  context.push("/drink", extra: {
                                    "uid": drinks[index].uid
                                  });
                                },
                                productModel: drinks[index],
                              ),
                            ),
                          ),
                          error: (error, stackTrace) => Container(),
                          loading: () => loadingWidget(),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        //const SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(languages[language]!["did_you_try_these"]!, style: kTitleTextStyle.copyWith(
                                fontSize: 17.w, color: kBrownLight
                              ),),
                              TextButton(
                                child: Row(
                                  spacing: 5,
                                  children: [
                                    Text(languages[language]!["all"]!, style: kTitleTextStyle.copyWith(
                                        fontSize: 14.w, color: kPrimaryOrange
                                    ),),
                                    Icon(CupertinoIcons.arrow_right, color: kPrimaryOrange, size: 12.w, fontWeight: FontWeight.bold,)
                                  ],
                                ),
                                onPressed: () {

                                  context.push("/cakes");
                                },
                              ),
                            ],
                          ),
                        ),
                        cakesProvider.when(
                          data: (cakes) => SizedBox(
                            height: 360.h,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(left: 20.0),
                              scrollDirection: Axis.horizontal,
                              itemCount: cakes.length,
                              clipBehavior: Clip.none,
                              itemBuilder: (context, index) => CakeCardWidget(
                                onPressed: () {
                                  context.push("/cake", extra: {
                                    "uid": cakes[index].uid
                                  });
                                },
                                productModel: cakes[index],
                                userFavorites: const [],

                              ),
                            ),
                          ),
                          error: (error, stackTrace) => Container(),
                          loading: () => loadingWidget(),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(languages[language]!["did_you_try_breakfasts"]!, style: kTitleTextStyle.copyWith(
                                  fontSize: 17.w, color: kBrownLight
                              ),),
                              TextButton(
                                child: Row(
                                  spacing: 5,
                                  children: [
                                    Text(languages[language]!["all"]!, style: kTitleTextStyle.copyWith(
                                        fontSize: 14.w, color: kPrimaryOrange
                                    ),),
                                    Icon(CupertinoIcons.arrow_right, color: kPrimaryOrange, size: 12.w, fontWeight: FontWeight.bold,)
                                  ],
                                ),
                                onPressed: () {
                                  context.push("/breakfasts");

                                },
                              ),
                            ],
                          ),
                        ),
                        breakfastsProvider.when(
                          data: (breakfasts) => SizedBox(
                            height: 360.h,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(left: 20.0),
                              scrollDirection: Axis.horizontal,
                              itemCount: breakfasts.length,
                              clipBehavior: Clip.none,
                              itemBuilder: (context, index) => CakeCardWidget(
                                onPressed: () {
                                  context.push("/breakfast", extra: {
                                    "uid": breakfasts[index].uid
                                  });
                                },
                                productModel: breakfasts[index],
                                userFavorites: const [],

                              ),
                            ),
                          ),
                          error: (error, stackTrace) => Container(),
                          loading: () => loadingWidget(),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )

      ],
    );
  }

  _incerement() {
    setState(() {
      if(count < 6) {
        count++;
      } else {
        count = 0;
      }
    });
  }
}
