import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/constants/app_constants.dart';

class CoffeeLoadBar extends StatelessWidget {
  final int current;
  final int total;
  final String imagePath;
  final bool theme;

  const CoffeeLoadBar({
    super.key,
    required this.current,
    required this.total,
    required this.imagePath,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    double progress = total == 0 ? 0 : current / total;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // The Circular Bar
            CustomPaint(
              size: Size(150.w, 150.h),
              painter: CoffeeProgressPainter(
                progress: progress,
                color: kPrimaryOrange,
              ),
            ),

            SizedBox(
              width: 65.w,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                "$current / $total",
                style: kTitleTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 0),


      ],
    );
  }
}

class CoffeeProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  CoffeeProgressPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 12.0;

    // 1. Draw Background Track (Gray)
    final trackPaint = Paint()
      ..color = kBrownSoft
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // 2. Draw Active Progress Arc (Orange)
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Angle math: Start from bottom-left (-220 degrees to +40 degrees)
    // to leave a gap at the bottom for the "0/0" text.
    const startAngle = 3 * pi / 4 + 0.2;
    const totalSweep = 3 * pi / 2 - 0.4;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweep,
      false,
      trackPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweep * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}