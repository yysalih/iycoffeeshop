import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/controllers/order_controller.dart';
import 'package:iycoffee/repos/breakfast_repository.dart';
import 'package:iycoffee/repos/cake_repository.dart';
import 'package:iycoffee/widgets/app_widgets/custom_squared_button.dart';
import "package:qr_flutter/qr_flutter.dart";
import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../repos/product_repository.dart';
import '../../widgets/app_widgets/warning_info_widget.dart';
import '../../widgets/shop_widgets/cake_card_widget.dart';
import '../../widgets/shop_widgets/drink_card_widget.dart';
import '../../widgets/wallet_widgets/wallet_widget.dart';
import '../shop_views/product_inner_view.dart';

class BreakfastsView extends ConsumerWidget {
  BreakfastsView({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final breakfastsProvider = ref.watch(breakfastsStreamProvider(""));


    return Stack(

      children: [
        Container(
          height: height,
          width: width,
          color: kLightBlack2,
        ),
        Positioned(
          top: height * -.275,
          right: -35,
          child: Image.asset("assets/icons/rabbit2.png", width: width * .65, color: kOrangeSubtle.withOpacity(.15),),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 25),
          child: Row(
            spacing: 10,
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.chevron_back, color: Colors.white,),
                onPressed: () => context.pop(),
              ),
              Text(languages[language]!["did_you_try_breakfasts"]!, style: kTitleTextStyle.copyWith(color: reverseTextColor(theme),
                  fontSize: 17.w),),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              Container(
                width: width, height: height * .82,
                color: Colors.white,
                child: breakfastsProvider.when(
                  data: (cakes) => GridView.builder(
                    itemCount: cakes.length,

                    itemBuilder: (context, index) => CakeCardWidget(
                      padding: 0,
                      scale: 0.5,
                      productModel: cakes[index],
                      fontSize: 14.w,
                      userFavorites: [],
                      onPressed: () {
                        Navigator.push(context, routeToView(ProductInnerView(uid: cakes[index].uid!,),),);
                      },

                    ),

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2, mainAxisSpacing: 15
                    ),
                  ),
                  error: (error, stackTrace) => Container(),
                  loading: () => loadingWidget(),
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}


