import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/controllers/product_controller.dart';
import 'package:iycoffee/repos/cake_repository.dart';
import 'package:iycoffee/repos/user_repository.dart';
import 'package:iycoffee/widgets/app_widgets/custom_squared_button.dart';
import 'package:iycoffee/widgets/app_widgets/warning_info_widget.dart';
import 'package:iycoffee/widgets/shop_widgets/cake_card_widget.dart';

import '../../constants/providers.dart';
import '../../repos/breakfast_repository.dart';
import '../../repos/product_repository.dart';
import '../../widgets/shop_widgets/coffee_progress_painter.dart';
import '../../widgets/shop_widgets/drink_card_widget.dart';
import '../auth_views/login_view.dart';

class ShopView extends ConsumerStatefulWidget {
  const ShopView({super.key});

  @override
  ConsumerState<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends ConsumerState<ShopView> {
  final List products = [
    "kruvasan",
    "berry_cup_cilekli",
    "berry_cup_krokanli",
    "berry_cup_lotuslu",
    "berry_cup_oreolu",
    "berry_pavlova",
    "bitter_cikolatali_pasta",
    "brownie",
    "cheesecake_cilek",
    "cheesecake_frambuaz",
    "cheesecake_yabanmersini",
    "chocolate_blueberry",
    "cookie_caramel",
    "cookie_chocolate",
    "crunberry",
    "cilek_raspberry",
    "cilekli_tart",
    "dubai_cikolatasi_pasta",
    "dubai_cikolatasi",
    "dubai_san_sebastian",
    "findik_tart",
    "fistik_ekler",
    "fistik_krokan",
    "fistik_ruyasi",
    "havuc_dilimi",
    "kremali_cilek_kruvasan",
    "lampos",
    "love_berry_beyaz",
    "love_berry_klasik",
    "love_berry_sutlu",
    "roll_tart",
    "royal_dubai",
    "sade_kruvasan",
    "san_sebastian",
    "snickers",
    "tiramisu",
  ];

  final List<double> prices = [150.0, 210.0, 190.0, 100.0, 150.0, 110.0, 290.0, 100.0, 150.0, 190.0];

  final images = [
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fkruvasan.jpg?alt=media&token=1c95b239-7213-42eb-b221-235844b87d2d",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fberry_cup_cilekli.jpg?alt=media&token=2e65835f-4329-4aa8-b073-f18c48aa9af8",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fberry_cup_krokanli.jpg?alt=media&token=51af9748-8103-4603-a10a-2cdc0890d3a9",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fberry_cup_lotuslu.jpg?alt=media&token=063662ef-db0a-457b-9171-fedccc4a9b76",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fberry_cup_oreolu.jpg?alt=media&token=cfcdfe75-77c2-4fc2-b7a5-85c28bb7c50c",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fberry_pavlova.jpg?alt=media&token=d642e522-3307-4c04-928f-27e60fb16e5d",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fbitter_cikolatali_pasta.jpg?alt=media&token=e91a9bf8-c941-4db4-ad09-e9edaa300417",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fbrownie.jpg?alt=media&token=61d2489e-426f-4f3e-8427-ccf312ad5e3f",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fcheesecake_cilek.jpg?alt=media&token=60e8f711-a37c-417c-955a-fa751debd553",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fcheesecake_frambuaz.jpg?alt=media&token=83719338-6990-4ed0-ba57-0f5241124921",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fcheesecake_yabanmersini.jpg?alt=media&token=14c1bd86-03ab-46b5-829b-f70772b16c47",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fchocolate_blueberry.jpg?alt=media&token=a3f2ba87-7677-4b54-b10b-a7203a334596",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fcookie_caramel.jpg?alt=media&token=6f841232-b675-4c09-bc16-57fef95273f8",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fcookie_chocolate.jpg?alt=media&token=e6867f3a-4863-4109-a611-9913e6008773",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fcrunberry.jpg?alt=media&token=f309123b-76a0-4327-be5e-ea71091ca209",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fcilek_raspberry.jpg?alt=media&token=f5ca8914-c610-4e51-b181-3f4540895749",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fcilekli_tart.jpg?alt=media&token=a6244778-9baa-49c8-a87d-371d6b9a088e",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fdubai_cikolatasi_pasta.jpg?alt=media&token=56c1b230-e13e-41b3-8563-04742904fd09",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fdubai_cikolatasi.jpg?alt=media&token=f024a568-e8c8-43f6-a9b8-30b535d9f485",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fdubai_san_sebastian.jpg?alt=media&token=a723a9d8-f9ae-4456-b0b9-9d4b133b18a8",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Ffindik_tart.jpg?alt=media&token=9839bdd6-af69-4bdf-a5f0-c48a1d83ae8f",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Ffistik_ekler.jpg?alt=media&token=89c19143-2a45-4a07-a7af-c57440d06550",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Ffistik_krokan.jpg?alt=media&token=b37335da-a94d-4cd0-9674-970e9b306191",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Ffistik_ruyasi.jpg?alt=media&token=2e73132a-5794-4e60-861d-befbd6b51b64",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fhavuc_dilimi.jpg?alt=media&token=340e4868-508b-4d1d-8b0c-c2c44aa38b4c",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fkremali_cilek_kruvasan.jpg?alt=media&token=e65227e4-b785-4578-a127-28ac5f0e0e40",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Flampos.jpg?alt=media&token=f785760b-24c0-4006-8ce6-fc9ad932a5fb",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Flove_berry_beyaz.jpg?alt=media&token=9b08ae56-a2ba-4601-9821-6dea0a6ea715",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Flove_berry_klasik.jpg?alt=media&token=5ac8b825-2d3f-4774-9a26-53eeb29ee30f",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Flove_berry_sutlu.jpg?alt=media&token=566bea2b-b13f-4741-91ad-733d052a426c",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Froll_tart.jpg?alt=media&token=632d846c-575b-43af-8175-3d9239f640a4",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Froyal_dubai.jpg?alt=media&token=61ad1877-dd2d-4c79-8de8-95742a13a261",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fsade_kruvasan.jpg?alt=media&token=4de2e27d-47ac-4d06-9525-55eb6cc3109a",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fsan_sebastian.jpg?alt=media&token=d332e187-81ce-4e92-b5dd-599c5d68ad89",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Fsnickers.jpg?alt=media&token=cb398fa8-455b-49f6-80e5-5c70f0385721",
    "https://firebasestorage.googleapis.com/v0/b/iycoffee.firebasestorage.app/o/cakes%2Ftiramisu.jpg?alt=media&token=5badb2c0-27f6-4021-b973-0908af5b978a"
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
          padding: const EdgeInsets.only(left: 20.0, right: 10, top: 35),
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
                                category: "cake",
                                price: prices[0],
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
                            showModalBottomSheet(context: context,
                              isScrollControlled: true,
                              constraints: BoxConstraints(maxHeight: height * .825),
                              builder: (context) => const LoginView(),);
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
