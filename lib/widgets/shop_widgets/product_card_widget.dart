import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';

import '../../constants/providers.dart';

class ProductCardWidget extends ConsumerWidget {
  final String name;
  final String price;
  const ProductCardWidget({super.key, required this.name, required this.price});


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
                onPressed: () {

                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
                              Text(name, style: kCustomTextStyle.copyWith(
                                  color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 2.h,),
                              Text(price, style: kCustomTextStyle.copyWith(
                                color: Colors.black, fontSize: 17,
                              ),),
                            ],
                          ),
                          ElevatedButton(
                            child: Icon(Icons.favorite, color: Colors.redAccent, size: 25,),
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.all(10),
                                shape: CircleBorder()
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
            bottom: 60.h,
            left: 70.w,
            child: Stack(
              clipBehavior: Clip.none,
              children: [

                Image.asset("assets/images/cup.png", width: 200.w,),
                Positioned(
                  top: 115.h, left: 65.w,
                  child: Image.asset("assets/images/logo.png", width: 65.w, color: Colors.white,),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
