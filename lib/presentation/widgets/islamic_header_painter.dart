import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class IslamicHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.islamicGold.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    const starSize = 12.0;
    const spacing = 24.0;

    for (double x = starSize / 2; x < size.width; x += spacing) {
      _drawStar(canvas, Offset(x, size.height / 2), starSize / 2, paint);
    }
  }

  void _drawStar(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    for (int i = 0; i < 8; i++) {
      final angle = (i * 3.14159 / 4) - 3.14159 / 2;
      final point = Offset(
        center.dx +
            radius *
                (i.isEven ? 1 : 0.5) *
                (angle.abs() / 2).clamp(0.3, 1) *
                (i % 2 == 0 ? 1 : -1) *
                (i < 4 ? 1 : -1),
        center.dy + radius * 0.3 * (i % 2 == 0 ? 1 : -1),
      );
      if (i == 0) {
        path.moveTo(center.dx + radius, center.dy);
      } else {
        path.lineTo(center.dx + radius * (i.isEven ? 1 : 0.5), center.dy);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
