import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/views/auth_views/fill_out_view.dart';
import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../controllers/auth_controller.dart';
import '../../services/authentication_service.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/input_field_widget.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final appLanguage = ref.watch(languageStateProvider);
    final theme = ref.watch(themeStateProvider);

    final authNotifier = ref.watch(authController.notifier);
    final authState = ref.watch(authController);

    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        children: [
          Image.asset(kBackgroundImage, width: width,
            height: height, fit: BoxFit.cover,),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.h),
              child: Container(
                decoration: BoxDecoration(
                  color: theme ? Colors.white : kDarkBackground,
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png",),
                    SizedBox(height: 20.h,),
                    customInputField(theme: theme, title: languages[appLanguage]!["email"]!,
                      hintText: languages[appLanguage]!["input_email"]!,
                      icon: Icons.local_post_office_outlined, onTap: () {

                      },
                      controller: authNotifier.emailController,
                      onChanged: (value) {

                      },),
                    SizedBox(height: 10.h,),
                    customInputField(theme: theme, title: languages[appLanguage]!["password"]!,
                      hintText: languages[appLanguage]!["input_password"]!,
                      icon: Icons.password, onTap: () {

                      }, controller: authNotifier.passwordController, onChanged: (value) {

                      },),
                    authState.isRegister ? Column(
                      children: [
                        SizedBox(height: 10.h,),
                        customInputField(theme: theme, title: languages[appLanguage]!["password_again"]!,
                          hintText: languages[appLanguage]!["input_password_again"]!,
                          icon: Icons.password, onTap: () {

                          }, controller: authNotifier.passwordAgainController, onChanged: (value) {

                          },),
                      ],
                    ) : Container(),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => authNotifier.switchRegister(),
                          child: Text(authState.isRegister ?
                          languages[appLanguage]!["already_have_account"]!
                              : languages[appLanguage]!["no_account"]!, style: kCustomTextStyle.copyWith(
                              color: kDarkBackground, fontSize: 15
                          ),),
                        ),
                        authState.isRegister ? Container()
                            : Text(languages[appLanguage]!["forgot_password"]!, style: kCustomTextStyle.copyWith(
                            color: kDarkBackground, fontSize: 15
                        ),),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    FutureBuilder(
                        future: Authentication.initializeFirebase(context: context, authNotifier: authNotifier),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return customButton(title: authState.isRegister ?
                            languages[appLanguage]!["sign_up"]! :
                            languages[appLanguage]!["login"]!, color: buttonColor(theme), onPressed: () async {
                              Navigator.push(context, routeToView(const FillOutView()));
                              //TODO uncomment below
                              //authNotifier.handleSignInWithEmail(authNotifier, context: context);
                            },);
                          }
                          return customButton(
                              title: authState.isRegister ?
                          languages[appLanguage]!["sign_up"]! :
                          languages[appLanguage]!["login"]!, color: cardColor(theme), onPressed: () {
                            Navigator.push(context, routeToView(const FillOutView()));
                            //TODO uncomment below
                            //authNotifier.handleSignInWithEmail(authNotifier, context: context);
                          }, inProgress: true);
                        }
                    ),
                    SizedBox(height: 10.h,),
                    Text(languages[appLanguage]!["or"]!, 
                      style: kCustomTextStyle.copyWith(color: textColor(theme)),),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder(
                            future: Authentication.initializeFirebase(context: context, authNotifier: authNotifier),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                return ElevatedButton(
                                  onPressed: ()  {
                                    Navigator.push(context, routeToView(const FillOutView()));
                                    //TODO uncomment below
                                    //authNotifier.handleSignIn(authNotifier, context: context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(10),
                                    backgroundColor: cardColor(theme), // <-- Button color
                                    foregroundColor: kWhite, // <-- Splash color
                                  ),
                                  child: Image.asset("assets/icons/google.png", width: 20.w,),
                                );
                              };
                              return ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, routeToView(const FillOutView()));
                                    //TODO uncomment below
                                    //authNotifier.handleSignIn(authNotifier, context: context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(10),
                                    backgroundColor: cardColor(theme), // <-- Button color
                                    foregroundColor: kWhite, // <-- Splash color
                                  ),
                                  child: const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white
                                    ),
                                  ));
                            }
                        ),
                        FutureBuilder(
                            future: Authentication.initializeFirebase(context: context, authNotifier: authNotifier),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                return ElevatedButton(
                                  onPressed: () async {
                                    Navigator.push(context, routeToView(const FillOutView()));
                                    //TODO uncomment below
                                    //authNotifier.handleSignInWithApple(authNotifier, context: context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(10),
                                    backgroundColor: cardColor(theme), // <-- Button color
                                    foregroundColor: kWhite, // <-- Splash color
                                  ),
                                  child: Image.asset("assets/icons/apple.png",
                                    color: textColor(theme), width: 20.w,),
                                );
                              }
                              return ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, routeToView(const FillOutView()));
                                  //TODO uncomment below
                                  //authNotifier.handleSignInWithApple(authNotifier, context: context);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor: cardColor(theme), // <-- Button color
                                  foregroundColor: kWhite, // <-- Splash color
                                ),
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white
                                  ),
                                )
                              );
                            }
                        ),
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
                    SizedBox(height: 10.h,),
                    TextButton(
                      child: Text(languages[appLanguage]!["anonymous_login"]!,
                        style: kCustomTextStyle.copyWith(
                          color: kDarkBackground
                      ),),
                      onPressed: () async {
                        // final getKey = get_server_key();
                        // final token = await getKey.server_token();
                        // debugPrint(token.toString());
                        authNotifier.handleSignInAnonymous(authNotifier, context: context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}