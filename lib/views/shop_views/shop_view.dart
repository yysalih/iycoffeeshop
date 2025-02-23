import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/models/product_model.dart';
import 'package:iycoffee/repos/user_repository.dart';
import 'package:iycoffee/views/shop_views/product_inner_view.dart';
import 'package:iycoffee/widgets/app_widgets/warning_info_widget.dart';
import 'package:iycoffee/widgets/shop_widgets/product_card_widget.dart';

import '../../constants/providers.dart';
import '../../repos/product_repository.dart';
import '../../widgets/shop_widgets/filter_button_widget.dart';

class ShopView extends ConsumerWidget {
  ShopView({super.key});

  final List products = ["coffee", "tea", "food"];
  final List coffees = ["latte", "americano", "mocha", "espresso"];
  final List prices = ["30.0", "25.0", "45.0", "20.0"];
  final List ratings = ["4.7", "4.3", "5.0", "3.5"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;

    final List descriptions = [
      languages[language]!["latte_description"]!,
       languages[language]!["americano_description"]!,
      languages[language]!["mocha_description"]!,
      languages[language]!["espresso_description"]!,
    ];

    final userProvider = ref.watch(userStreamProvider(currentUserUid));
    final productsProvider = ref.watch(productsStreamProvider(""));

    return SingleChildScrollView(  // Wrap everything in SingleChildScrollView
      child: userProvider.when(
        data: (user) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(100)),
                color: reverseBackgroundColor(theme),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          color: backGroundColor(theme),
                          width: 250.w,
                        ),
                        CircleAvatar(
                          radius: 30.h,
                          backgroundColor: buttonColor(theme),
                          backgroundImage: CachedNetworkImageProvider(user.image!),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "${languages[language]!["welcome"]!} ${user.name} ${user.lastname}",
                      style: kTitleTextStyle.copyWith(
                        color: backGroundColor(theme),
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < products.length; i++)
                          FilterButtonWidget(text: products[i], onPressed: () {

                          }),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                languages[language]!["most_popular"]!,
                style: kTitleTextStyle.copyWith(
                  color: textColor(theme),
                ),
              ),
            ),
            SizedBox(height: 40.h),

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

            SizedBox(height: 40.h),
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
                    userFavorites: user.favorites!,
                  ),
                ),
              ),
              error: (error, stackTrace) => Container(),
              loading: () => loadingWidget(),
            ),

          ],
        ),
        error: (error, stackTrace) => Container(),
        loading: () => loadingWidget(),
      ),
    );
  }

}
