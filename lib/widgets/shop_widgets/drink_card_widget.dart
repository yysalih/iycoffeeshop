import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/controllers/product_controller.dart';
import 'package:iycoffee/models/product_model.dart';

import '../../constants/providers.dart';
import '../cup_widget.dart';
import '../favorite_button_widget.dart';

class DrinkCardWidget extends ConsumerWidget {
  final ProductModel productModel;
  final Function() onPressed;
  final List userFavorites;
  const DrinkCardWidget({super.key,
    required this.productModel,
    required this.onPressed,
    required this.userFavorites,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final drinksNotifier = ref.watch(drinksController.notifier);
    final language = ref.watch(languageStateProvider);


    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        spacing: 3,
        children: [
          GestureDetector(
            onTap: () {

            },
            child: CircleAvatar(
              backgroundColor: kBackgroundCream,
              radius: 50.w,
              child: CachedNetworkImage(
                imageUrl: productModel.image!,
                width: 75.w,
              ),
            ),
          ),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 80.w),
            child: Text(languages[language]![productModel.name!]!,
              style: kTitleTextStyle.copyWith(
                color: textColor(theme), fontSize: 13.w
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
