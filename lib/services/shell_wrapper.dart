import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/app_widgets/app_bottom_bar_widget2.dart';


class ShellWrapper extends StatefulWidget {
  final Widget child;
  final bool showBar;

  const ShellWrapper({
    super.key,
    required this.child,
    required this.showBar
  });

  @override
  State<ShellWrapper> createState() => _ShellWrapperState();
}

class _ShellWrapperState extends State<ShellWrapper> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: widget.showBar && kIsWeb ?
      PreferredSize(
        preferredSize: size,
        child: const AppBottomBarWidget(),
      )
          : null,
      backgroundColor: Colors.white,
      body: widget.child,
      bottomNavigationBar: widget.showBar && !kIsWeb
          ? const AppBottomBarWidget()
          : null,
    );
  }
}