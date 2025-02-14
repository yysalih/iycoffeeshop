import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';



class FilterButtonWidget extends ConsumerWidget {
  final String text;
  final Function() onPressed;
  const FilterButtonWidget({super.key, required this.text, required this.onPressed,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: buttonColor(theme)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: MaterialButton(

          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(languages[language]![text]!, style: kCustomTextStyle.copyWith(
                color: cardColor(theme),
            ),),
          ),
        ),
      ),
    );
  }
}

