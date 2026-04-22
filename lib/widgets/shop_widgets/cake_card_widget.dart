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

class CakeCardWidget extends ConsumerWidget {
  final ProductModel productModel;
  final Function() onPressed;
  final List userFavorites;
  const CakeCardWidget({super.key,
    required this.productModel,
    required this.onPressed,
    required this.userFavorites,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final productNotifier = ref.watch(productController.notifier);
    final language = ref.watch(languageStateProvider);


    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          Container(
            width: width * .85, height: height * .4,
            decoration: BoxDecoration(
              color: textColor(!theme),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: CachedNetworkImageProvider(productModel.image!), fit: BoxFit.cover)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                onPressed: onPressed,
                child: Container(),
              ),
            )

          ),

          Text(languages[language]![productModel.name!]!, style: kTitleTextStyle.copyWith(
            color: textColor(theme), fontSize: 15.w
          ),),
        ],
      ),
    );
  }
}
