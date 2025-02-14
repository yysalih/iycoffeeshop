import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/providers.dart';

class BackButtonWidget extends ConsumerWidget {
  final Color buttonColor;
  final Color iconColor;
  const BackButtonWidget({super.key,
    required this.buttonColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 40, height: 40,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(Icons.arrow_back_ios_new, size: 20.w, color: iconColor,),
        ),
      ),
    );
  }
}
