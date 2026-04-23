import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({super.key});

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> with TickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: width, height: height * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kPrimaryOrange,
                  kOrangeLight
                ]
            )
          ),
        ),
        Positioned(
          bottom: 0,
          left: -45,
          child: Image.asset(
            "assets/icons/rabbit.png",
            color: Colors.white,
            width: width * .7,
          ),
        ),

        Positioned(
          bottom: 0,
          right: 20,
          child: Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Image.asset("assets/icons/mastercard.png", width: 35.w,),
              Image.asset("assets/icons/visa.png", width: 35.w,),
              Image.asset("assets/icons/troy.png", width: 35.w,),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 20,
          child: Text("0.0 ₺", style: kTitleTextStyle.copyWith(color: Colors.white, fontSize: 20.w),),
        ),

      ],
    );
  }
}
