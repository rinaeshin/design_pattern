import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../models/animation_stage.dart';

/// Renders the stage using CustomPaint
class AnimationCanvas extends StatelessWidget {
  final AnimationStage stage;

  const AnimationCanvas({required this.stage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomPaint(
        painter: AnimationPainter(stage),
      ),
    );
  }
}

/// CustomPainter that draws circles, arrows, and labels
class AnimationPainter extends CustomPainter {
  final AnimationStage stage;

  AnimationPainter(this.stage);

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw arrows first (behind circles)
    for (var arrow in stage.arrows) {
      _drawArrow(canvas, arrow);
    }

    // 2. Draw circles on top
    for (var circle in stage.circles) {
      _drawCircle(canvas, circle);
    }
  }

  void _drawCircle(Canvas canvas, CircleNode circle) {
    // Draw shadow
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.15)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawCircle(
        circle.position + const Offset(2, 2), circle.radius, shadowPaint);

    // Draw circle
    final circlePaint = Paint()
      ..color = circle.color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(circle.position, circle.radius, circlePaint);

    // Draw border
    final borderPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(circle.position, circle.radius, borderPaint);

    // Draw label
    if (circle.label != null) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: circle.label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        circle.position - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }
  }

  void _drawArrow(Canvas canvas, ArrowPath arrow) {
    final paint = Paint()
      ..color = arrow.color
      ..strokeWidth = arrow.strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Dashed line
    if (arrow.dashed) {
      _drawDashedLine(canvas, arrow.start, arrow.end, paint);
    } else {
      canvas.drawLine(arrow.start, arrow.end, paint);
    }

    // Arrowhead
    _drawArrowhead(canvas, arrow.start, arrow.end, paint);
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const dashWidth = 5.0;
    const dashSpace = 3.0;

    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;
    final distance = math.sqrt(dx * dx + dy * dy);
    final dashCount = (distance / (dashWidth + dashSpace)).floor();

    for (int i = 0; i < dashCount; i++) {
      final t1 = i * (dashWidth + dashSpace) / distance;
      final t2 =
          math.min((i * (dashWidth + dashSpace) + dashWidth) / distance, 1.0);

      final p1 = Offset(start.dx + dx * t1, start.dy + dy * t1);
      final p2 = Offset(start.dx + dx * t2, start.dy + dy * t2);

      canvas.drawLine(p1, p2, paint);
    }
  }

  void _drawArrowhead(Canvas canvas, Offset start, Offset end, Paint paint) {
    const arrowSize = 10.0;

    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;
    final angle = math.atan2(dy, dx);

    final path = Path()
      ..moveTo(end.dx, end.dy)
      ..lineTo(
        end.dx - arrowSize * math.cos(angle - math.pi / 6),
        end.dy - arrowSize * math.sin(angle - math.pi / 6),
      )
      ..lineTo(
        end.dx - arrowSize * math.cos(angle + math.pi / 6),
        end.dy - arrowSize * math.sin(angle + math.pi / 6),
      )
      ..close();

    canvas.drawPath(path, paint..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant AnimationPainter oldDelegate) {
    return oldDelegate.stage != stage;
  }
}
