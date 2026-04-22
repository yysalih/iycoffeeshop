import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../../widgets/shop_widgets/filter_button_widget.dart';

class ShopView extends ConsumerStatefulWidget {
  const ShopView({super.key});

  @override
  ConsumerState<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends ConsumerState<ShopView> {
  final List products = [
    "blueberry_pancake",
    "eggs_strawberry_yogurt_pastry",
    "eggs_avocados",
    "eggs_croissant_berries",
    "eggs_fruits_tomato",
    "eggs_mushrooms_avocado",
    "honey_butter_pancake",
    "sandwich_avocados",
    "strawberry_pancake",
    "toasted_bread_butter_fruits"
  ];

  final List<double> prices = [350.0, 210.0, 390.0, 300.0, 250.0, 310.0, 490.0, 300.0, 250.0, 190.0];

  final images = [
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/breakfasts%2Fblueberry_pancake.jpg?alt=media&token=cda830fd-6460-467f-852d-5b2f620a65c6",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/breakfasts%2Feggs__strawberry_yogurt_pastry.jpg?alt=media&token=165aa8d6-1db6-4e36-b786-1b99f2fff3d9",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/breakfasts%2Feggs_avocados.jpg?alt=media&token=21022dad-6fca-43c5-9f2d-0e703c99e56d",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/breakfasts%2Feggs_croissant_berries.jpg?alt=media&token=93794d1b-1410-4709-bf66-e6c3e07520e0",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/breakfasts%2Feggs_fruits_tomato.jpg?alt=media&token=0c416cbb-4be7-41d6-8778-9a6544550935",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/breakfasts%2Feggs_mushrooms_avocado.jpg?alt=media&token=424f84a4-c0d2-49b1-a8e4-adb403142941",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/breakfasts%2Fhoney_butter_pancake.jpg?alt=media&token=5382b997-5efe-4188-948d-8e2c72960efc",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/breakfasts%2Fsandwich_avocados.jpg?alt=media&token=3a5f51d0-d98f-4bc5-942a-0a29e27e9180",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/breakfasts%2Fstrawberry_pancake.jpg?alt=media&token=44b2d33b-343c-42ad-a722-82e501656d2a",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/breakfasts%2Ftoasted_bread_butter_fruits.jpg?alt=media&token=8470d8eb-760a-4cd4-92c2-86a3ce97a9b2"

  ];


  int count = 0;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final List descriptions = [
      languages[language]!["latte_description"]!,
       languages[language]!["americano_description"]!,
      languages[language]!["mocha_description"]!,
      languages[language]!["espresso_description"]!,
    ];

    final userProvider = ref.watch(userStreamProvider(currentUserUid));
    final productsProvider = ref.watch(productsStreamProvider(""));
    final cakesProvider = ref.watch(cakesStreamProvider(""));
    final breakfastsProvider = ref.watch(breakfastsStreamProvider(""));



    final productNotifier = ref.watch(productController.notifier);

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
                            for(int i = 0; i < products.length; i++) {
                              productNotifier.createProduct(
                                title: products[i],
                                description: "${products[i]}_description",
                                category: "breakfast",
                                price: prices[i],
                                image: images[i]
                              );
                            }
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
                                  Navigator.push(context, routeToView(ProductInnerView(uid: cakes[index].uid!,),),);
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
                                  Navigator.push(context, routeToView(ProductInnerView(uid: breakfasts[index].uid!,),),);
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

        /*SingleChildScrollView(  // Wrap everything in SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


                productsProvider.when(
                  data: (products) => SizedBox(
                    height: 200.h,  // Set a fixed height to make it scrollable horizontally
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 20.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) => ProductCardWidget(
                        onPressed: () {
                          Navigator.push(context, routeToView(ProductInnerView(uid: products[index].uid!,),),);
                        },
                        productModel: products[index],
                        userFavorites: user.favorites!,

                      ),
                    ),
                  ),
                  error: (error, stackTrace) => Container(),
                  loading: () => loadingWidget(),
                ),

                SizedBox(height: 240.h),
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
                productsProvider.when(
                  data: (products) => SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 20.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) => ProductCardWidget(
                        productModel: products[index],
                        onPressed: () {
                          Navigator.push(context, routeToView(ProductInnerView(
                            uid: products[index].uid!,
                          )),);
                        },
                        userFavorites: const []//user.favorites!,
                      ),
                    ),
                  ),
                  error: (error, stackTrace) => Container(),
                  loading: () => loadingWidget(),
                ),

            ],
          )
        ),*/
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
