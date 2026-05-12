import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/views/auth_views/fill_out_view.dart';
import 'package:iycoffee/widgets/app_widgets/custom_circle_button.dart';
import 'package:iycoffee/widgets/app_widgets/custom_input_field_widget.dart';
import 'package:iycoffee/widgets/app_widgets/custom_squared_button.dart';
import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../controllers/auth_controller.dart';
import '../../services/authentication_service.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/input_field_widget.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {


  @override
  void initState() {
    super.initState();

    final authNotifier = ref.read(authController.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool userExists = await Authentication.initializeFirebase(authNotifier: authNotifier);

      if (!mounted) return;

      if (userExists) {
        context.go("/main");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final appLanguage = ref.watch(languageStateProvider);
    final theme = ref.watch(themeStateProvider);

    final authNotifier = ref.watch(authController.notifier);
    final authState = ref.watch(authController);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.h),
      child: Container(
        decoration: BoxDecoration(
            color: theme ? Colors.white : kDarkBackground,
            borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 20,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(languages[appLanguage]!["login"]!, style: kTitleTextStyle.copyWith(
                        fontSize: 15.w
                      ),
                    ),
                    IconButton(
                      splashRadius: 20.w,
                      icon: const Icon(CupertinoIcons.clear_thick_circled, color: kLightGrey,),
                      iconSize: 25.w,
                      onPressed: () {
                        context.pop();
                      },
                    )
                  ],
                ),
                Image.asset("assets/icons/rabbit2.png", width: 130.w, color: kPrimaryOrange,),

                Column(
                  spacing: 10,
                  children: [
                    CustomInputField(
                      titleColor: textColor(theme),
                      title: languages[appLanguage]!["email"]!,
                      hintText: languages[appLanguage]!["input_email"]!,
                      controller: authNotifier.emailController,),

                    CustomInputField(

                        titleColor: textColor(theme),
                        title: languages[appLanguage]!["password"]!,
                        hintText: languages[appLanguage]!["input_password"]!,
                        controller: authNotifier.passwordController
                    ),
                    if(authState.isRegister) CustomInputField(
                      titleColor: textColor(theme),
                      title: languages[appLanguage]!["password_again"]!,
                      hintText: languages[appLanguage]!["input_password_again"]!,
                      controller: authNotifier.passwordAgainController,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => authNotifier.switchRegister(),
                          child: Text(authState.isRegister ?
                          languages[appLanguage]!["already_have_account"]!
                              : languages[appLanguage]!["no_account"]!, style: kCustomTextStyle.copyWith(
                              color: kDarkBackground, fontSize: 13.w
                          ),),
                        ),
                        if(!authState.isRegister) Text(languages[appLanguage]!["forgot_password"]!,
                          style: kCustomTextStyle.copyWith(
                              color: kDarkBackground, fontSize: 13.w
                          ),),
                      ],
                    ),
                  ],
                ),
              ],
            ),


            CustomSquaredButton(
              width: width,
              height: 45.h,
              borderRadius: 25,
              enableBorder: true,
              borderColor: grayTextColor(theme).withOpacity(.2),
              title: authState.isRegister ? languages[appLanguage]!["sign_up"]! : languages[appLanguage]!["login"]!,
              color: kPrimaryOrange,
              textStyle: kTitleTextStyle.copyWith(color: Colors.white, fontSize: 16.w),
              onPressed: () async {

                authNotifier.handleSignInWithEmail(authNotifier, context: context);
              },
            ),
            /*
            Text(languages[appLanguage]!["or"]!,
              style: kCustomTextStyle.copyWith(color: textColor(theme), fontSize: 13.w),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: ()  {
                    authNotifier.handleSignIn(authNotifier, context: context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: backGroundColor(theme),
                    foregroundColor: kWhite,
                  ),
                  child: Image.asset("assets/icons/google.png", width: 20.w,),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context, routeToView(const FillOutView()));
                    authNotifier.handleSignInWithApple(authNotifier, context: context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: backGroundColor(theme),
                    foregroundColor: kWhite,
                  ),
                  child: Image.asset("assets/icons/apple.png",
                    color: textColor(theme), width: 20.w,),
                )
              ],
            ),


            SizedBox(height: 20.h,),
            Wrap(

              children: [
                Text(languages[appLanguage]!["by_continuing"]!,
                  style: kCustomTextStyle.copyWith(color: textColor(theme)),),
                Text(languages[appLanguage]!["user_agreement"]!,
                  style: kCustomTextStyle.copyWith(
                      color: kDarkBackground
                  ),),
                Text(languages[appLanguage]!["accepted_user_agreement"]!,
                  style: kCustomTextStyle.copyWith(color: textColor(theme)),),
              ],
            ),

            TextButton(
              child: Text(languages[appLanguage]!["anonymous_login"]!,
                style: kCustomTextStyle.copyWith(
                    color: kDarkBackground
                ),),
              onPressed: () async {
                authNotifier.handleSignInAnonymous(authNotifier, context: context);
              },
            ),*/
          ],
        ),
      ),
    );
  }
}