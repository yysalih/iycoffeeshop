import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../cup_widget.dart';
import '../favorite_button_widget.dart';

class BasketProductWidget extends ConsumerWidget {

  final String name;
  final String price;
  final Function() onPressed;

  const BasketProductWidget({super.key,
    required this.name,
    required this.price,
    required this.onPressed,
  });



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    int count = 0;

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
                  onPressed: onPressed,
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
                              Text(languages[language]![name]!, style: kTitleTextStyle.copyWith(
                                color: Colors.white, fontSize: 20
                            ), ),
                              SizedBox(height: 2.h,),
                              Text("$price TL", style: kCustomTextStyle.copyWith(
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
                                  count--;
                                },
                              ),
                            ),
                            Text(count.toString(), style: kTitleTextStyle.copyWith(
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
                                  count++;

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