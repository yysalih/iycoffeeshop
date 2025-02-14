import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';

import '../../constants/providers.dart';
import '../cup_widget.dart';
import '../favorite_button_widget.dart';

class ProductCardWidget extends ConsumerWidget {
  final String name;
  final String price;
  final Function() onPressed;
  const ProductCardWidget({super.key, required this.name,
    required this.price,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width * .55, height: height * .3,
            decoration: BoxDecoration(
              color: textColor(!theme),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                onPressed: onPressed,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.star, color: Colors.orangeAccent, size: 25,),
                          SizedBox(width: 5,),
                          Text("4.6", style: kCustomTextStyle.copyWith(
                              fontWeight: FontWeight.bold, color: textColor(theme)
                          ),),


                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name, style: kTitleTextStyle.copyWith(
                                  color: Colors.white,
                              ),),
                              SizedBox(height: 2.h,),
                              Text(price, style: kCustomTextStyle.copyWith(
                                color: Colors.grey.shade300, fontSize: 15,
                              ),),
                            ],
                          ),
                          CustomizableElevatedButton(onPressed: () {

                          },),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )

          ),
          const CupWidget(),

        ],
      ),
    );
  }
}
