import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/controllers/order_controller.dart';
import 'package:iycoffee/widgets/app_widgets/custom_circle_button.dart';
import 'package:iycoffee/widgets/app_widgets/custom_squared_button.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../widgets/wallet_widgets/wallet_widget.dart';

class WalletView extends ConsumerWidget {
  WalletView({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final orderState = ref.watch(orderController);
    final orderNotifier = ref.watch(orderController.notifier);


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
          padding: const EdgeInsets.only(left: 20.0, right: 10, top: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(languages[language]!["payment"]!, style: kTitleTextStyle.copyWith(color: reverseTextColor(theme), fontSize: 20.w),),
              IconButton(
                iconSize: 30.w,
                icon: Icon(CupertinoIcons.person_alt_circle_fill, color: reverseTextColor(theme),),
                onPressed: () {

                },
              ),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const WalletWidget(),

                      Container(
                        decoration: BoxDecoration(
                          color: kOrangeSubtle,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kPrimaryBrown, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 5,
                            children: [
                              Text("${languages[language]!["for_every_drink"]!} 1", style: kTitleTextStyle.copyWith(
                                color: kBlack, fontSize: 13.w
                              ),),
                              Icon(Icons.star,color: kPrimaryOrange, size: 17.w,),
                              Text(languages[language]!["earn"]!, style: kTitleTextStyle.copyWith(
                                  color: kBlack, fontSize: 13.w
                              ),),
                            ],
                          ),
                        ),
                      ),

                      QrImageView(
                        data: 'https://berrycoffee.com/${DateTime.now().millisecondsSinceEpoch}',
                        version: QrVersions.auto,
                        size: 200.h,
                        gapless: false,

                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: kBlack,
                        ),
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.circle,
                          color: kBlack,
                        ),
                      ),

                      CustomSquaredButton(
                        width: 120.w,
                        height: 30,
                        borderRadius: 40,
                        borderColor: kBlack,
                        enableBorder: true,
                        color: Colors.white,
                        textStyle: kTitleTextStyle.copyWith(color: Colors.black, fontSize: 12.w),
                        title: languages[language]!["new_code"]!,
                        onPressed: () {

                        },
                      ),
                      CustomSquaredButton(
                        width: width,
                        height: 40.h,
                        borderRadius: 40,
                        color: kPrimaryOrange,
                        gradient: LinearGradient(
                          colors: [kPrimaryOrange, kPrimaryOrange.withOpacity(.6)],
                          begin: Alignment.topCenter, end: Alignment.bottomCenter
                        ),
                        textStyle: kTitleTextStyle.copyWith(color: Colors.white, fontSize: 15.w),
                        title: languages[language]!["add_money"]!,
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}


