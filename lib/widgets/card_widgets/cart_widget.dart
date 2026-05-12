import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/models/cart_item_model.dart';

import '../../constants/app_constants.dart';
import '../../controllers/order_controller.dart';
import '../../controllers/product_controller.dart';

class CartWidget extends ConsumerWidget {
  final String title;
  final String image;
  final String productUid;
  final int piece;
  final bool isFav;
  final List userFavorites;
  final CartItemModel model;

  const CartWidget({super.key, required this.title, required this.image, 
    required this.userFavorites,
    required this.productUid,
    required this.isFav,
    required this.piece,
    required this.model
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final productController = ref.watch(drinksController.notifier);

    final orderNotifier = ref.watch(orderController.notifier);

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kLightBackground, width: 1)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            children: [
              Row(
                spacing: 25,
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: CachedNetworkImageProvider(image, maxHeight: 200, maxWidth: 200),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(title, style: kTitleTextStyle.copyWith(fontSize: 15),),
                      Container(width: width * .5, height: .7, color: kTextGrey.withOpacity(.35),)
                    ],
                  ),
                ],
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(isFav ? CupertinoIcons.heart_circle_fill : CupertinoIcons.heart_circle, 
                    color: !isFav ? kLightGrey : Colors.redAccent, size: 30.w,),
                    splashRadius: 10,
                    onPressed: () {
                      debugPrint("Current user uid: ${FirebaseAuth.instance.currentUser!.uid}");
                      productController.addFavoriteProduct(productUid: productUid, userFavorites: userFavorites);
                    },
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(CupertinoIcons.minus_circle, 
                        color: kOrangeDark, size: 30.w,),
                        splashRadius: 20,
                        onPressed: () {
                          orderNotifier.changePiece(model, isIncrement: false);

                        },
                      ),
                      Text(piece.toString(), style: kTitleTextStyle.copyWith(fontSize: 13.w),),
                      IconButton(
                        icon: Icon(CupertinoIcons.add_circled_solid, color: kGreen, size: 30.w,),
                        splashRadius: 20,
                        onPressed: () {
                          orderNotifier.changePiece(model, isIncrement: true);
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
      
        )
      ),
    );
  }
}