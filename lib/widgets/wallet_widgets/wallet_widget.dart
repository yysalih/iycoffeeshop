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
      duration: const Duration(milliseconds: 4000),
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
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Adjust sweepPos to move relative to the rabbit's width
              final double sweepPos = (_controller.value * 3) - 1.5;

              return ShaderMask(
                shaderCallback: (rect) => LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [sweepPos - 0.2, sweepPos, sweepPos + 0.2],
                  colors: [
                    const Color(0xFFFFE5D9).withOpacity(0), // Light Peach/Copper
                    const Color(0xFFFFCCB3),               // Bright Copper Shine
                    const Color(0xFFFFE5D9).withOpacity(0),
                  ],
                ).createShader(rect),
                blendMode: BlendMode.srcATop,
                child: child,
              );
            },
            child: Image.asset(
              "assets/icons/rabbit.png",
              color: Colors.white.withOpacity(1),
              width: 280.w,
              fit: BoxFit.fitWidth,
            ),
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
