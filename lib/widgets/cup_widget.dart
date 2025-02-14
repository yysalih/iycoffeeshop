import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CupWidget extends StatelessWidget {
  final bool isPositioned;
  final double cupSize;
  final double logoSize;
  final double top;
  final double left;

  const CupWidget({super.key,
    this.isPositioned = true,
    this.cupSize = 200,
    this.logoSize = 110,
    this.top = 140,
    this.left = 35,
  });

  @override
  Widget build(BuildContext context) {
    if(isPositioned) {
        return Positioned(
        bottom: 80.h,
        left: 120.w,
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            Image.asset("assets/images/cup.png", width: 100.w,),
            Positioned(
              top: 85.h, left: 20.w,
              child: Image.asset("assets/images/logo.png", width: 65.w, color: Colors.white,),
            ),
          ],
        ),
      );
    }
    else {
      return  Stack(
        clipBehavior: Clip.none,
        children: [

          Image.asset("assets/images/cup.png", width: cupSize,),
          Positioned(
            top: top, left: left,
            child: Image.asset("assets/images/logo.png", width: logoSize, color: Colors.white,),
          ),
        ],
      );
    }
  }
}
