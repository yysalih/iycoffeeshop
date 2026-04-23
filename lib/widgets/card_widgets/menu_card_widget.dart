import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/controllers/product_controller.dart';

import '../../constants/providers.dart';


class MenuCardWidget extends ConsumerWidget {
  final String title;
  final String image;
  final Function() onPressed;
  const MenuCardWidget({super.key,
    required this.title,
    required this.image,
    required this.onPressed
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final drinksNotifier = ref.watch(drinksController.notifier);
    final language = ref.watch(languageStateProvider);


    return Column(
      children: [
        Container(
          width: width * .43, height: height * .3,
          decoration: BoxDecoration(
            color: textColor(!theme),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage("assets/images/$image.jpg"), fit: BoxFit.cover)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: MaterialButton(
              onPressed: onPressed,
              child: Container(),
            ),
          )

        ),

        Text(languages[language]![title]!, style: kTitleTextStyle.copyWith(
          color: textColor(theme), fontSize: 15.w
        ),),
      ],
    );
  }
}
