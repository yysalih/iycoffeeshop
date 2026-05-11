import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/repos/cake_repository.dart';
import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../widgets/app_widgets/warning_info_widget.dart';
import '../../widgets/shop_widgets/cake_card_widget.dart';
import '../shop_views/product_inner_view.dart';

class CakesView extends ConsumerWidget {
  CakesView({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final cakesProvider = ref.watch(cakesStreamProvider(""));


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
          padding: const EdgeInsets.only(left: 0.0, top: 35),
          child: Row(
            spacing: 10,
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.chevron_back, color: Colors.white,),
                onPressed: () => context.pop(),
              ),
              Text(languages[language]!["did_you_try_these"]!, style: kTitleTextStyle.copyWith(color: reverseTextColor(theme),
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
                child: cakesProvider.when(
                  data: (cakes) => GridView.builder(
                    itemCount: cakes.length,
                    padding: const EdgeInsets.only(bottom: 20),

                    itemBuilder: (context, index) => CakeCardWidget(
                      padding: 0,
                      scale: 0.5,
                      productModel: cakes[index],
                      userFavorites: const [],
                      onPressed: () {

                        context.push("/cake", extra: {
                          "uid": cakes[index].uid
                        });
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


