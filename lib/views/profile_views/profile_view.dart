import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/controllers/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../auth_views/login_view.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateProvider);

    final language = ref.watch(languageStateProvider);

    final width = MediaQuery.of(context).size.width;

    final profileNotifier = ref.watch(profileController.notifier);


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(languages[language]!["my_profile"]!,
            style: kTitleTextStyle.copyWith(color: textColor(theme)),),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {

              },
              child: Center(
                child: CircleAvatar(
                  radius: 30.h,
                  backgroundColor: buttonColor(theme),
                  child: Image.asset("assets/icons/photo.png", width: 40.w),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Text("Rasim Ozan", style: kTitleTextStyle.copyWith(color: textColor(theme)),),
            SizedBox(height: 10.h,),
            Text("+90 553 098 11 78", style: kCustomTextStyle.copyWith(color: textColor(theme),),),
            SizedBox(height: 10.h,),
            Text("rasimozan@gmail.com", style: kCustomTextStyle.copyWith(color: textColor(theme),),),
          ],
        ),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: textColor(!theme),
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileButtonWidget(width: width,
                  theme: theme,
                  title: languages[language]!["edit_profile"]!,
                  icon: Icons.edit,
                  onPressed: () {

                  },),

                ProfileButtonWidget(width: width, theme: theme, title: languages[language]!["languages"]!, icon: Icons.language,
                  onPressed: () {
                    showLanguageDialog(context, language, theme, width);
                  },),

                ProfileButtonWidget(width: width, theme: theme,
                  title: languages[language]!["theme"]!, icon: Icons.dark_mode_outlined,
                  onPressed: () {
                    showThemeDialog(context, language, theme, width);
                  },),

                ProfileButtonWidget(width: width, theme: theme,
                  title: languages[language]!["saved_cards"]!, icon: Icons.credit_card,
                  onPressed: () {

                  },),
                ProfileButtonWidget(width: width, theme: theme,
                  title: languages[language]!["delete_your_account"]!,
                  icon: Icons.delete_forever_outlined,
                  onPressed: () {
                    //profileNotifier.deleteAccount(context, language);
                    Navigator.pushAndRemoveUntil(context, routeToView(const LoginView()), (route) => false);

                  },),
                ProfileButtonWidget(width: width, title: languages[language]!["logout"]!,
                  theme: theme,
                  icon: Icons.logout,
                  onPressed: () {
                    //profileNotifier.logout(context);
                    Navigator.pushAndRemoveUntil(context, routeToView(const LoginView()), (route) => false);
                  },),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class ProfileButtonWidget extends StatelessWidget {
  final double width;
  final String title;
  final bool theme;
  final IconData icon;
  final Function() onPressed;
  const ProfileButtonWidget({super.key, required this.width,
    required this.onPressed,
    this.theme = true,
    required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: [
              Icon(icon, color: textColor(theme),),
              SizedBox(width: 10.w,),
              Text(title, style: kCustomTextStyle.copyWith(color: textColor(theme),),)
            ],
          ),
        ),
      ),
    );
  }
}


showLanguageDialog(BuildContext context, String language, bool theme, double width) {
  showDialog(context: context, builder: (context) => AlertDialog(
    backgroundColor: backGroundColor(theme),
    title: Text(languages[language]!["switch_language"]!, style: kCustomTextStyle.copyWith(
        color: textColor(theme)
    ),),
    content: Consumer(
      builder: (context, ref, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width,
            child: MaterialButton(
              height: 40.h,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("language", "en");
                ref.read(languageStateProvider.notifier).state = "en";
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("English", style: kCustomTextStyle.copyWith(
                    color: textColor(theme)
                ),),
              ),
            ),
          ),
          SizedBox(
            width: width,
            child: MaterialButton(
              height: 40.h,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("language", "ar");
                ref.read(languageStateProvider.notifier).state = "ar";
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Arabic", style: kCustomTextStyle.copyWith(
                    color: textColor(theme)
                ),),
              ),
            ),
          ),
          SizedBox(
            width: width,
            child: MaterialButton(
              height: 40.h,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("language", "tr");
                ref.read(languageStateProvider.notifier).state = "tr";
                Navigator.pop(context);
              },
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Türkçe", style: kCustomTextStyle.copyWith(
                      color: textColor(theme)
                  ),)),
            ),
          ),
        ],
      ),
      child: Container(),
    ),
  ),);
}

showThemeDialog(BuildContext context, String language, bool theme, double width) {
  showDialog(context: context, builder: (context) => AlertDialog(
    backgroundColor: backGroundColor(theme),
    title: Text(languages[language]!["switch_theme"]!, style: kCustomTextStyle.copyWith(
      color: textColor(theme)
    ),),
    content: Consumer(
      builder: (context, ref, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width,
            child: MaterialButton(
              height: 40.h,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool("theme", true);
                ref.read(themeStateProvider.notifier).state = true;
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Light", style: kCustomTextStyle.copyWith(
                    color: textColor(theme)
                ),),
              ),
            ),
          ),
          SizedBox(
            width: width,
            child: MaterialButton(
              height: 40.h,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool("theme", false);
                ref.read(themeStateProvider.notifier).state = false;
                Navigator.pop(context);
              },
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Dark", style: kCustomTextStyle.copyWith(
                    color: textColor(theme)
                  ),)),
            ),
          ),
        ],
      ),
      child: Container(),
    ),
  ),);
}