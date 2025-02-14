import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/constants/providers.dart';

class BackButtonWidget extends ConsumerWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);
    return Container(
      width: 40, height: 40,
      decoration: BoxDecoration(
        color: buttonColor(theme),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Icon(Icons.arrow_back_ios_new, color: textColor(theme),),
          ),
        ),
      ),
    );
  }
}
