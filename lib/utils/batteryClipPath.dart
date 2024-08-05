import 'package:flutter/material.dart';

class BatteryCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.07179487, size.height * 0.8465986);
    path_0.lineTo(size.width * 0.07179487, size.height * 0.2122260);
    path_0.cubicTo(
        size.width * 0.07179487,
        size.height * 0.1816360,
        size.width * 0.08980462,
        size.height * 0.1522986,
        size.width * 0.1218621,
        size.height * 0.1306682);
    path_0.cubicTo(
        size.width * 0.1539195,
        size.height * 0.1090377,
        size.width * 0.1973990,
        size.height * 0.09688581,
        size.width * 0.2427349,
        size.height * 0.09688581);
    path_0.lineTo(size.width * 0.2854703, size.height * 0.09688581);
    path_0.cubicTo(
        size.width * 0.2968041,
        size.height * 0.09688581,
        size.width * 0.3076738,
        size.height * 0.09384775,
        size.width * 0.3156882,
        size.height * 0.08844014);
    path_0.cubicTo(
        size.width * 0.3237026,
        size.height * 0.08303253,
        size.width * 0.3282051,
        size.height * 0.07569827,
        size.width * 0.3282051,
        size.height * 0.06805087);
    path_0.cubicTo(
        size.width * 0.3282051,
        size.height * 0.06040311,
        size.width * 0.3327077,
        size.height * 0.05306886,
        size.width * 0.3407221,
        size.height * 0.04766125);
    path_0.cubicTo(
        size.width * 0.3487364,
        size.height * 0.04225363,
        size.width * 0.3596062,
        size.height * 0.03921557,
        size.width * 0.3709400,
        size.height * 0.03921557);
    path_0.lineTo(size.width * 0.6273487, size.height * 0.03921557);
    path_0.cubicTo(
        size.width * 0.6386821,
        size.height * 0.03921557,
        size.width * 0.6495538,
        size.height * 0.04225363,
        size.width * 0.6575692,
        size.height * 0.04766125);
    path_0.cubicTo(
        size.width * 0.6655846,
        size.height * 0.05306886,
        size.width * 0.6700872,
        size.height * 0.06040311,
        size.width * 0.6700872,
        size.height * 0.06805087);
    path_0.cubicTo(
        size.width * 0.6700872,
        size.height * 0.07569827,
        size.width * 0.6745897,
        size.height * 0.08303253,
        size.width * 0.6826000,
        size.height * 0.08844014);
    path_0.cubicTo(
        size.width * 0.6906154,
        size.height * 0.09384775,
        size.width * 0.7014872,
        size.height * 0.09688581,
        size.width * 0.7128205,
        size.height * 0.09688581);
    path_0.lineTo(size.width * 0.7555538, size.height * 0.09688581);
    path_0.cubicTo(
        size.width * 0.8008923,
        size.height * 0.09688581,
        size.width * 0.8443692,
        size.height * 0.1090377,
        size.width * 0.8764308,
        size.height * 0.1306682);
    path_0.cubicTo(
        size.width * 0.9084872,
        size.height * 0.1522986,
        size.width * 0.9264974,
        size.height * 0.1816360,
        size.width * 0.9264974,
        size.height * 0.2122260);
    path_0.lineTo(size.width * 0.9264974, size.height * 0.8465986);
    path_0.cubicTo(
        size.width * 0.9264974,
        size.height * 0.8771869,
        size.width * 0.9084872,
        size.height * 0.9065260,
        size.width * 0.8764308,
        size.height * 0.9281557);
    path_0.cubicTo(
        size.width * 0.8443692,
        size.height * 0.9497855,
        size.width * 0.8008923,
        size.height * 0.9619377,
        size.width * 0.7555538,
        size.height * 0.9619377);
    path_0.lineTo(size.width * 0.2427349, size.height * 0.9619377);
    path_0.cubicTo(
        size.width * 0.1973990,
        size.height * 0.9619377,
        size.width * 0.1539195,
        size.height * 0.9497855,
        size.width * 0.1218621,
        size.height * 0.9281557);
    path_0.cubicTo(
        size.width * 0.08980462,
        size.height * 0.9065260,
        size.width * 0.07179487,
        size.height * 0.8771869,
        size.width * 0.07179487,
        size.height * 0.8465986);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02589744;
    paint_0_stroke.color = Colors.white.withOpacity(1.0);
    paint_0_stroke.strokeCap = StrokeCap.round;
    paint_0_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint_0_stroke);

    canvas.drawPath(path_0, paint_0_stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
