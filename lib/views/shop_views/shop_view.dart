import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/models/product_model.dart';
import 'package:iycoffee/repos/user_repository.dart';
import 'package:iycoffee/views/shop_views/product_inner_view.dart';
import 'package:iycoffee/widgets/app_widgets/custom_circle_button.dart';
import 'package:iycoffee/widgets/app_widgets/warning_info_widget.dart';
import 'package:iycoffee/widgets/shop_widgets/product_card_widget.dart';

import '../../constants/providers.dart';
import '../../repos/product_repository.dart';
import '../../widgets/shop_widgets/coffee_progress_painter.dart';
import '../../widgets/shop_widgets/filter_button_widget.dart';

class ShopView extends ConsumerStatefulWidget {
  const ShopView({super.key});

  @override
  ConsumerState<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends ConsumerState<ShopView> {
  final List products = ["coffee", "tea", "food"];

  final List coffees = ["latte", "americano", "mocha", "espresso"];

  final List prices = ["30.0", "25.0", "45.0", "20.0"];

  final List ratings = ["4.7", "4.3", "5.0", "3.5"];

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
