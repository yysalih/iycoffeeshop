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
    final language = ref.watch(languageStateProvider);
    final authNotifier = ref.watch(authController.notifier);
    final authState = ref.watch(authController);

    final profileNotifier = ref.watch(profileController.notifier);
    final profileState = ref.watch(profileController);

    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close, color: kWhite,),
                  ),
                  Text(languages[language]!["fill_out"]!, style: kTitleTextStyle.copyWith(
                      color: kWhite
                  ),),
                  Container()
                ],
              ),

              Row(
                children: [
                  CircleAvatar(
                    radius: 40.h,
                    backgroundColor: kLightBlack,
                    backgroundImage: profileState.image.isEmpty ? authNotifier.currentUser!.photoURL == null ? null
                        : CachedNetworkImageProvider(authNotifier.currentUser!.photoURL!) :
                    CachedNetworkImageProvider(profileState.image)
                    ,
                    child: profileState.image.isEmpty ? authNotifier.currentUser!.photoURL != null ? null
                        : toEdit ? CachedNetworkImage(imageUrl: authState.currentUser.image!)
                        : Image.asset("assets/icons/photo.png", width: 50.w,) : null,
                  ),
                  SizedBox(width: 10.w,),
                  TextButton(
                    child: Row(
                      children: [
                        const Icon(Icons.add, color: kWhite,),
                        SizedBox(width: 10.w,),
                        Text(languages[language]!["add_photo"]!, style: kCustomTextStyle,),
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
                  customInputField(title: languages[language]!["name"]!,
                    hintText: languages[language]!["input_name"]!,
                    icon: Icons.person, onTap: () {

                    }, controller: authNotifier.nameController..text = toEdit ?
                    authState.currentUser.name! :
                      authNotifier.currentUser!.displayName == null ? ""
                          : authNotifier.currentUser!.displayName ?? authNotifier.nameController.text,
                   onChanged: (value) {

                   },),
                  SizedBox(height: 10.h,),
                  customInputField(title: languages[language]!["surname"]!,
                    hintText: languages[language]!["input_surname"]!,
                    icon: Icons.person, onTap: () {

                    }, controller: authNotifier.surnameController..text = toEdit
                        ? authState.currentUser.lastname! :
                         authNotifier.surnameController.text, onChanged: (value) {

                      },),
                  SizedBox(height: 10.h,),
                  customInputField(title: languages[language]!["email"]!,
                    hintText: languages[language]!["input_email"]!,
                    icon: Icons.local_post_office, onTap: () {

                    }, controller: authNotifier.emailController..text = toEdit ? authState.currentUser.email! :
                      authNotifier.currentUser!.email ?? authNotifier.emailController.text, onChanged: (value) {

                      },),
                  SizedBox(height: 10.h,),
                  customInputField(title: languages[language]!["phone"]!,
                    hintText: languages[language]!["input_phone"]!,
                    icon: Icons.phone, onTap: () {

                    }, controller: authNotifier.phoneController..text = toEdit
                        ? authState.currentUser.phone! : authNotifier.phoneController.text,
                  onChanged: (value) {

                  },),
                ],
              ),


              customButton(title: languages[language]![toEdit ? "save" : "continue"]!, color: kGreen, onPressed: () async {

                if(!toEdit && authNotifier.isAbleToContinue) {
                  await authNotifier.createUser(context: context, errorTitle: languages[language]!["problem_signing_up"]!);

                  Navigator.push(context, routeToView(const MainView()));
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
    );
  }
}
