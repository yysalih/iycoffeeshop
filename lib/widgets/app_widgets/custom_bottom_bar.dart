import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';

class CustomBottomBar extends ConsumerWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageStateProvider);

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 70.h,
          alignment: Alignment.topCenter,
          //width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                BottomBarItem(
                  label: languages[language]!["menu"]!,
                  icon: "cup",
                  selected: currentIndex == 0,
                  onTap: () => onTap(0),
                ),
                BottomBarItem(
                  label: languages[language]!["wallet"]!,
                  icon: "qr",
                  selected: currentIndex == 1,
                  onTap: () => onTap(1),
                ),
                SizedBox(width: 60.w),
                /*BottomBarItem(
                  label: languages[language]!["home"]!,
                  icon: "rabbit",
                  selected: currentIndex == 2,
                  onTap: () => onTap(2),
                ),*/
                BottomBarItem(
                  label: languages[language]!["store"]!,
                  icon: "location",
                  selected: currentIndex == 3,
                  onTap: () => onTap(3),
                ),
                BottomBarItem(
                  label: languages[language]!["settings"]!,
                  icon: "setting",
                  selected: currentIndex == 4,
                  onTap: () => onTap(4),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: -10.h,
          child: CenterActionButton(
            isActive: true,
            onTap: () => onTap(2),
          ),
        )
      ],
    );
  }
}



class CenterActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;

  const CenterActionButton({
    super.key,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(

        children: [

          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kPrimaryOrange,
                  kOrangeLight
                ]
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                  "assets/icons/rabbit.png",
                  color: Colors.white,
                  width: 35.w
              ),
            ),
          )
        ],
      ),
    );
  }
}



class BottomBarItem extends StatelessWidget {
  final String label;
  final String icon;
  final bool selected;
  final VoidCallback onTap;

  const BottomBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? kPrimaryOrange : kBrownLight;

    return GestureDetector(
      onTap: onTap,
      child: kIsWeb ?
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/icons/$icon.png", width: kIsWeb ? 20 : 20.w, color: color),
           const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      )
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/icons/$icon.png", width: kIsWeb ? 20 : (icon == "rabbit" ? 25 : 23.w), color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: icon == "rabbit" ? 13 : 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
class BottomBarItemWeb extends StatelessWidget {
  final String label;
  final String icon;
  final bool selected;
  final VoidCallback onTap;

  const BottomBarItemWeb({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.white : kHintColor;

    return kIsWeb ?
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(kIsWeb ? 0 : 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/icons/$icon.png", width: kIsWeb ? 18 : 20.w, color: color),
               const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    )
        : Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/icons/$icon.png", width: kIsWeb ? 18 : 20.w, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}


class CustomBottomBarWeb extends ConsumerWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBarWeb({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: kPrimaryOrange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomBarItemWeb(
            label: languages[language]!["home"]!,
            icon: "rabbit",
            selected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          BottomBarItemWeb(
            label: languages[language]!["menu"]!,
            icon: "cup",
            selected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          BottomBarItemWeb(
            label: languages[language]!["wallet"]!,
            icon: "qr",
            selected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          BottomBarItemWeb(
            label: languages[language]!["store"]!,
            icon: "location",
            selected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
          BottomBarItemWeb(
            label: languages[language]!["settings"]!,
            icon: "setting",
            selected: currentIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}
