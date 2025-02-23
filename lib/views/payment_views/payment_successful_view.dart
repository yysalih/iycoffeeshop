import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/main.dart';
import 'package:iycoffee/views/main_view.dart';

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
      body: SafeArea(
        child: Center(
          child: PaymentSuccessfulWidget(
            icon: "done",
            theme: theme,
            color: Colors.green,
            text: languages[language]!["success_creating_order"]!,
            language: language,
          ),
        ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png", width: 350.w, color: textColor(theme),),
        SizedBox(height: 40.h,),
        Image.asset("assets/icons/$icon.png", width: 200.w, color: color,),
        SizedBox(height: 40.h,),
        Text(text, style: kCustomTextStyle.copyWith(
          color: textColor(theme),
        ),),
        SizedBox(height: 20.h,),
        TextButton(
          child: Text(languages[language]!["go_home"]!, style: kCustomTextStyle.copyWith(
            color: backGroundColor(!theme), fontWeight: FontWeight.bold
          ),),
          onPressed: () => Navigator.push(context, routeToView(const MainView())),
        ),
      ],
    );
  }
}
