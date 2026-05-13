import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';

import '../../constants/languages.dart';


class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/warning.png", width: 75.w,),
          SizedBox(height: 10.h,),
          Text("Yükleme sırasında bir hata oluştu. Lütfen sayfayı yenileyiniz.",
            style: kCustomTextStyle.copyWith(color: kLightGrey), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}


class BasicLoadingWidget extends StatelessWidget {
  const BasicLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: CircularProgressIndicator(),),
          SizedBox(height: 10.h,),
          const Text("Yükleniyor...",
            style: kCustomTextStyle,)
        ],
      ),
    );
  }
}

class CreatingOrderDialog extends StatelessWidget {
  const CreatingOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15,
        children: [
          Image.asset("assets/icons/rabbit2.png", width: 75.w, color: kPrimaryOrange,),
          const Center(child: CircularProgressIndicator(),),
          Text("Sipariş oluşturuluyor...",
            style: kCustomTextStyle.copyWith(color: kBlack),)
        ],
      ),
    );
  }
}

class NoChatFoundWidget extends StatelessWidget {
  final String language;
  const NoChatFoundWidget({super.key, this.language = "tr"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/envelope.png", width: kIsWeb ? 50 : 55.w,),
          SizedBox(height: kIsWeb ? 20 : 20.h,),
          Text(languages[language]!["no_chat_found"]!,
            style: kCustomTextStyle.copyWith(color: kLightGrey, fontSize: kIsWeb ? 13 : 13.w),)
        ],
      ),
    );
  }
}

class NoNotFoundWidget extends StatelessWidget {
  final String language;
  const NoNotFoundWidget({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/notification.png", width: kIsWeb ? 50 : 55.w,),
          SizedBox(height: 20,),
          Text(languages[language]!["no_notification_found"]!,
            style: kCustomTextStyle.copyWith(color: kLightGrey, fontSize: kIsWeb ? 13 : 13.w),)
        ],
      ),
    );
  }
}

class NoUserFoundWidget extends StatelessWidget {
  const NoUserFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_search_rounded, color: kBlueColor, size: kIsWeb ? 45 : 50.w,),
          SizedBox(height: 10,),
          const Text("Burada Kimse Yok!",
            style: kCustomTextStyle,)
        ],
      ),
    );
  }
}

class SendFirstMessage extends StatelessWidget {
  const SendFirstMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/chatting.png", width: 50.w, color: kBlueColor,),
          SizedBox(height: 10.h,),
          Text("İlk Mesaj Gönderen Sen Ol!",
            style: kCustomTextStyle.copyWith(fontSize: 13.w))
        ],
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Function() onPressed;
  final Color? iconColor;
  const CustomAlertDialog({super.key, required this.image, required this.title,
  this.iconColor,
    required this.description, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: kTitleTextStyle.copyWith(fontSize: 15.w, color: kBlack),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //SizedBox(height: 20.h,),
          Text(description, style: kCustomTextStyle.copyWith(
              color: kBlack, fontSize: 14.w),),
          SizedBox(height: 20.h,),
          Image.asset("assets/icons/$image.png", width: 100.w, color: iconColor,),
          // SizedBox(height: 20.h,),
        ],
      ),
      actions: [
        // TextButton(
        //   child: const Text("Tamam", style: kCustomTextStyle,),
        //   onPressed: () => context.pop(),
        // ),
        TextButton(
          onPressed: onPressed,
          child: Text("Tamam", style: kCustomTextStyle.copyWith(
              color: kBlack, fontSize: 13.w
          ),),
        )
      ],
    );
  }
}
