import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/widgets/app_widgets/back_button_widget.dart';
import 'package:iycoffee/widgets/cup_widget.dart';
import 'package:iycoffee/widgets/favorite_button_widget.dart';

import '../../constants/app_constants.dart';
import '../../constants/providers.dart';

class ProductInnerView extends ConsumerWidget {
  final String coffee;
  final String rating;
  final String description;
  final String prices;
  const ProductInnerView({super.key,
    required this.coffee,
    required this.rating,
    required this.description, required this.prices,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: reverseBackgroundColor(theme),
      body: SafeArea(
        child: Column(
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
                            Text(languages[language]![coffee]!, style: kTitleTextStyle.copyWith(
                              color: textColor(theme), fontSize: 20
                            ),),
                            const FavoriteButtonWidget()
                          ],
                        ),

                        Row(
                          children: [
                            for(int i = 0; i < double.parse(rating); i++)
                              const Padding(
                                padding: EdgeInsets.only(right: 0.0),
                                child: Icon(Icons.star, color: Colors.orangeAccent,),
                              ),
                            SizedBox(width: 10.w,),
                            Text(rating, style: kCustomTextStyle.copyWith(
                              color: textColor(theme)
                            ),)
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        Text(description, style: kCustomTextStyle.copyWith(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(prices, style: kCustomTextStyle.copyWith(
                                  fontWeight: FontWeight.bold
                                ),),
                                Text("   |   ", style: kCustomTextStyle,),
                                const Icon(Icons.shopping_cart_outlined,
                                  size: 17,
                                  color: Colors.white,)
                              ],
                            ),
                            onPressed: () {

                            },
                          ),
                          CustomizableButton(
                            child: Text(languages[language]!["order"]!, style: kCustomTextStyle,),
                            onPressed: () {

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
      ),
    );
  }
}

class CustomizableButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final Function() onPressed;
  const CustomizableButton({super.key,
    required this.child,
    required this.onPressed,
    this.color = kDarkSecondary,
    this.borderRadius = 5
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width * .35, height: 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialButton(
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
