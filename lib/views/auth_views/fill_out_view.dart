import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/views/main_view.dart';

import '../../constants/app_constants.dart';
import '../../constants/languages.dart';
import '../../constants/providers.dart';
import '../../constants/snackbars.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/input_field_widget.dart';

class FillOutView extends ConsumerWidget {
  final bool toEdit;
  const FillOutView({super.key, this.toEdit = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final language = ref.watch(languageStateProvider);
    final theme = ref.watch(themeStateProvider);

    final authNotifier = ref.watch(authController.notifier);
    final authState = ref.watch(authController);

    final profileNotifier = ref.watch(profileController.notifier);
    final profileState = ref.watch(profileController);

    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        children: [
          Image.asset(kBackgroundImage, width: width,
            height: height, fit: BoxFit.cover,),
          SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.h),
              child: Container(
                decoration: BoxDecoration(
                    color: theme ? Colors.white : kDarkBackground,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40.h,
                          backgroundColor: backGroundColor(theme),
                          backgroundImage: profileState.image.isEmpty ? authNotifier.currentUser == null ? null :
                          authNotifier.currentUser!.photoURL == null ? null
                              : CachedNetworkImageProvider(authNotifier.currentUser!.photoURL!) :
                          CachedNetworkImageProvider(profileState.image)
                          ,
                          child: profileState.image.isEmpty ? authNotifier.currentUser == null ?
                          Image.asset("assets/icons/photo.png", width: 50.w,) :
                          authNotifier.currentUser!.photoURL != null ? null
                              : toEdit ? CachedNetworkImage(imageUrl: authState.currentUser.image!)
                              : Image.asset("assets/icons/photo.png", width: 50.w,) : null,
                        ),
                        SizedBox(width: 10.w,),
                        TextButton(
                          child: Row(
                            children: [
                              Icon(Icons.add, color: textColor(theme),),
                              SizedBox(width: 10.w,),
                              Text(languages[language]!["add_photo"]!, style: kCustomTextStyle.copyWith(
                                color: textColor(theme)
                              ),),
                            ],
                          ),
                          onPressed: () {
                            profileNotifier.showPicker(context, language: language);
                          },
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        customInputField(theme: theme, title: languages[language]!["name"]!,
                          hintText: languages[language]!["input_name"]!,
                          icon: Icons.person, onTap: () {

                          }, controller: authNotifier.nameController..text = toEdit ?
                          authState.currentUser.name! :
                          authNotifier.currentUser == null ? "" :
                          authNotifier.currentUser!.displayName == null ? ""
                                : authNotifier.currentUser!.displayName ?? authNotifier.nameController.text,
                         onChanged: (value) {

                         },),
                        SizedBox(height: 10.h,),
                        customInputField(theme: theme, title: languages[language]!["surname"]!,
                          hintText: languages[language]!["input_surname"]!,
                          icon: Icons.person, onTap: () {

                          }, controller: authNotifier.surnameController..text = toEdit
                              ? authState.currentUser.lastname! :
                               authNotifier.surnameController.text, onChanged: (value) {

                            },),
                        SizedBox(height: 10.h,),
                        customInputField(theme: theme, title: languages[language]!["email"]!,
                          hintText: languages[language]!["input_email"]!,
                          icon: Icons.local_post_office, onTap: () {

                          }, controller: authNotifier.emailController..text = toEdit ? authState.currentUser.email! :
                          authNotifier.currentUser == null ? authNotifier.emailController.text :
                          authNotifier.currentUser!.email ?? authNotifier.emailController.text, onChanged: (value) {

                            },),
                        SizedBox(height: 10.h,),
                        customInputField(theme: theme, title: languages[language]!["phone"]!,
                          hintText: languages[language]!["input_phone"]!,
                          icon: Icons.phone, onTap: () {

                          }, controller: authNotifier.phoneController..text = toEdit
                              ? authState.currentUser.phone! : authNotifier.phoneController.text,
                        onChanged: (value) {

                        },),
                      ],
                    ),


                    customButton(title: languages[language]![toEdit ? "save" : "continue"]!,
                      color: buttonColor(theme), onPressed: () async {
                        Navigator.push(context, routeToView(const MainView()));
                      if(!toEdit && authNotifier.isAbleToContinue) {
                        //TODO await authNotifier.createUser(context: context, errorTitle: languages[language]!["problem_signing_up"]!);


                      }
                      else if(!authNotifier.isAbleToContinue) {
                        showWarningSnackbar(context: context, title: languages[language]!["missing_values"]!);
                      }
                      else {
                        authNotifier.editUser(context: context,
                            image: profileState.image.isNotEmpty ? profileState.image : authState.currentUser.image!,
                            errorTitle: languages[language]!["error_editing_user"]!,
                            succesTitle: languages[language]!["success_editing_user"]!);
                      }
                    },),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: EdgeInsets.only(left: 20.0.w, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: ()  {
                        Navigator.pop(context);
                        //TODO uncomment below
                        //authNotifier.handleSignIn(authNotifier, context: context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(0),
                        backgroundColor: buttonColor(theme), // <-- Button color
                        foregroundColor: kWhite, // <-- Splash color
                      ),
                      child: Icon(Icons.close, color: cardColor(theme),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(languages[language]!["fill_out"]!, style: kTitleTextStyle.copyWith(
                          color: kWhite
                      ),),
                    ),
                    Container()
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
