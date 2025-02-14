import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/providers.dart';

import '../../constants/app_constants.dart';
import '../../controllers/main_controller.dart';

class AppBottomBarWidget extends ConsumerWidget {
  const AppBottomBarWidget({super.key});

  List<BottomNavigationBarItem> _buildBottomNavItems(mainNotifier, String language) {
    return mainNotifier.pageInfo(language).map<BottomNavigationBarItem>((page) {
      return BottomNavigationBarItem(
        icon: Icon(page["icon"]),
        label: page["label"],
      );
    }).toList();
  }


  ThemeData _bottomBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      canvasColor: kBlack,
      textTheme: Theme.of(context).textTheme,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mainNotifier = ref.read(mainController.notifier);
    final mainState = ref.watch(mainController);

    final theme = ref.watch(themeStateProvider);
    final language = ref.watch(languageStateProvider);

    return Theme(
      data: _bottomBarTheme(context),
      child: BottomNavigationBar(
        backgroundColor: backGroundColor(theme),
        currentIndex: mainState.bottomIndex,
        onTap: mainNotifier.changePage,
        selectedItemColor: textColor(!theme),
        unselectedItemColor: textColor(theme),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: _buildBottomNavItems(mainNotifier, language),
      ),
    );
  }
}
