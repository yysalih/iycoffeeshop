import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/main.dart';
import 'package:iycoffee/views/main_view.dart';
import 'package:iycoffee/widgets/app_widgets/app_bar_widget.dart';

import '../../constants/providers.dart';

class PaymentSuccessfulView extends ConsumerWidget {
  const PaymentSuccessfulView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backGroundColor(theme),
      body: Stack(
        children: [
          const AppBarWidget(title: "your_order"),
          Positioned(
            bottom: 0,
            child: PaymentSuccessfulWidget(
              icon: "done",
              theme: theme,
              color: Colors.green,
              text: languages[language]!["success_creating_order"]!,
              language: language,
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentSuccessfulWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final String text;
  final bool theme;
  final String language;
  const PaymentSuccessfulWidget({super.key,
    required this.icon,
    required this.color,
    required this.text,
    required this.theme,
    required this.language});

    @override
  Widget build(BuildContext context) {
    
    final primaryTextColor = textColor(theme);
    final buttonTextColor = backGroundColor(!theme);

    return Container(
      width: double.infinity, 
      height: 0.82.sh,        
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24.w), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The Illustration
          Image.asset(
            "assets/icons/rabbit2.png",
            width: 150.w,
            color: kPrimaryBrown,
          ),
          
          40.verticalSpace, 

          Text(
            text,
            textAlign: TextAlign.center, 
            style: kCustomTextStyle.copyWith(
              color: primaryTextColor,
              fontSize: 16.sp, 
            ),
          ),

          20.verticalSpace,

          FilledButton.tonal( 
            onPressed: () => context.push("/menu"),
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            ),
            child: Text(
              languages[language]!["go_home"]!,
              style: kCustomTextStyle.copyWith(
                color: buttonTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
