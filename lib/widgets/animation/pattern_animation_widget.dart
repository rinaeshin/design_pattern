import 'package:flutter/material.dart';
import '../../models/animation_stage.dart';
import 'animation_canvas.dart';
import 'animation_controls.dart';

/// Main widget for pattern animations (non-developer mode)
class PatternAnimationWidget extends StatefulWidget {
  final String patternId;
  final List<AnimationStage> stages;

  const PatternAnimationWidget({
    required this.patternId,
    required this.stages,
    super.key,
  });

  @override
  State<PatternAnimationWidget> createState() =>
      _PatternAnimationWidgetState();
}

class _PatternAnimationWidgetState extends State<PatternAnimationWidget> {
  int _currentStage = 0;
  bool _confirmReset = false;

  bool get _isFirstStage => _currentStage == 0;
  bool get _isLastStage => _currentStage == widget.stages.length - 1;

  void _nextStage() {
    if (!_isLastStage) {
      setState(() {
        _currentStage++;
        _confirmReset = false;
      });
    }
  }

  void _prevStage() {
    if (!_isFirstStage) {
      setState(() {
        _currentStage--;
        _confirmReset = false;
      });
    }
  }

  void _handleReset() {
    if (_confirmReset) {
      setState(() {
        _currentStage = 0;
        _confirmReset = false;
      });
    } else {
      setState(() => _confirmReset = true);
      // Auto-cancel confirmation after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _confirmReset = false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final stage = widget.stages[_currentStage];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Stage indicator
        Text(
          'Stage ${stage.step} / ${widget.stages.length}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),

        // Description
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            stage.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 16),

        // Animation canvas
        AnimationCanvas(stage: stage),
        const SizedBox(height: 16),

        // Navigation controls
        AnimationControls(
          isFirstStage: _isFirstStage,
          isLastStage: _isLastStage,
          confirmReset: _confirmReset,
          onPrev: _prevStage,
          onNext: _nextStage,
          onReset: _handleReset,
        ),
      ],
    );
  }
}
