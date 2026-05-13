import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/constants/providers.dart';

import '../../constants/app_constants.dart';

class AppBarWidget extends ConsumerWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);  
    
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
                Text(languages[language]![title]!, style: kTitleTextStyle.copyWith(
                  color: reverseTextColor(theme),
                    fontSize: 17.w),),
              ],
            ),
          ),
      ],
    );
  }
}