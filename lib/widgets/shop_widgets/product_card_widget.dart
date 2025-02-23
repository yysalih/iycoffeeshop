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

class ProductCardWidget extends ConsumerWidget {
  final ProductModel productModel;
  final Function() onPressed;
  final List userFavorites;
  const ProductCardWidget({super.key,
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
                          const Icon(Icons.star, color: Colors.orangeAccent, size: 25,),
                          const SizedBox(width: 5,),
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
                              Text(productModel.name!, style: kTitleTextStyle.copyWith(
                                  color: Colors.white,
                              ),),
                              SizedBox(height: 2.h,),
                              Text(productModel.price.toString(), style: kCustomTextStyle.copyWith(
                                color: Colors.grey.shade300, fontSize: 15,
                              ),),
                            ],
                          ),
                          CustomizableElevatedButton(onPressed: () {
                            productNotifier.addFavoriteProduct(productUid: productModel.uid!,
                                userFavorites: userFavorites);
                          }, icon: userFavorites.contains(productModel.uid!) ?
                              Icons.favorite : Icons.favorite_border,),
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
