import 'package:flutter/material.dart';

class BottomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * -0.0001867, size.height * 1.0015750);
    path0.quadraticBezierTo(size.width * -0.0001867, size.height * 0.3073500,
        size.width * 0.0001867, size.height * 0.0623250);
    path0.cubicTo(
        size.width * 0.0134400,
        size.height * 0.0151000,
        size.width * 0.4007467,
        size.height * 0.0032750,
        size.width * 0.5001600,
        size.height * 0.0017500);
    path0.cubicTo(
        size.width * 0.6033333,
        size.height * 0.0029750,
        size.width * 0.9766667,
        size.height * 0.0154250,
        size.width,
        size.height * 0.0627250);
    path0.quadraticBezierTo(size.width * 1.0016800, size.height * 0.2997750,
        size.width, size.height * 1.0015750);
    path0.lineTo(size.width * -0.0001867, size.height * 1.0015750);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
