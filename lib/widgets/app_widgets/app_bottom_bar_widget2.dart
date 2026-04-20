import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../controllers/main_controller.dart';
import 'custom_bottom_bar.dart';

class AppBottomBarWidget extends ConsumerWidget {
  const AppBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mainNotifier = ref.watch(mainController.notifier);
    final mainState = ref.watch(mainController);

    return CustomBottomBar(
      currentIndex: _getIndex(context, mainState.bottomIndex),
      onTap: (index) {
        mainNotifier.changePage(index);
        switch (index) {
          case 0:
            context.go('/menu');
            break;
          case 1:
            context.go('/wallet');
            break;
          case 2:
            context.go('/home');
            break;
          case 3:
            context.go('/store');
            break;
          case 4:
            context.go('/settings');
            break;
        }
      },

    );
  }

  int _getIndex(BuildContext context, int index) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/menu')) return 0;
    if (location.startsWith('/wallet')) return 1;
    if (location.startsWith('/home')) return 2;
    if (location.startsWith('/store')) return 3;
    if (location.startsWith('/settings')) return 4;
    return index; // default = home
  }
}
