import 'dart:ui';

/// Represents one frame/stage in the pattern animation
class AnimationStage {
  final int step;
  final String description;
  final List<CircleNode> circles;
  final List<ArrowPath> arrows;

  const AnimationStage({
    required this.step,
    required this.description,
    required this.circles,
    required this.arrows,
  });
}

/// A visual circle node in the animation
class CircleNode {
  final Offset position;
  final double radius;
  final Color color;
  final String? label;

  const CircleNode({
    required this.position,
    this.radius = 30.0,
    required this.color,
    this.label,
  });
}

/// An arrow connecting nodes or indicating flow
class ArrowPath {
  final Offset start;
  final Offset end;
  final Color color;
  final double strokeWidth;
  final bool dashed;

  const ArrowPath({
    required this.start,
    required this.end,
    this.color = const Color(0xFF424242),
    this.strokeWidth = 2.5,
    this.dashed = false,
  });
}
