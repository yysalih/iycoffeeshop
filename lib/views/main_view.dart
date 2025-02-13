import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/providers.dart';

import '../constants/app_constants.dart';
import '../controllers/main_controller.dart';
import '../widgets/app_widgets/app_bottom_bar_widget.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final theme = ref.watch(themeStateProvider);

    final mainState = ref.watch(mainController);
    final mainNotifier = ref.read(mainController.notifier);

    return Scaffold(
      backgroundColor: backGroundColor(theme),
      body: SafeArea(child: mainNotifier.pages[mainState.bottomIndex]),
      bottomNavigationBar: const AppBottomBarWidget(),
    );
  }
}
