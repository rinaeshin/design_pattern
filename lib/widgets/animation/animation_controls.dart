import 'package:flutter/material.dart';

/// Navigation controls for animation stages
class AnimationControls extends StatelessWidget {
  final bool isFirstStage;
  final bool isLastStage;
  final bool confirmReset;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onReset;

  const AnimationControls({
    required this.isFirstStage,
    required this.isLastStage,
    required this.confirmReset,
    required this.onPrev,
    required this.onNext,
    required this.onReset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left: Previous button
        SizedBox(
          width: 100,
          child: isFirstStage
              ? const SizedBox.shrink()
              : IconButton.outlined(
                  onPressed: onPrev,
                  icon: const Icon(Icons.arrow_back),
                  tooltip: '이전 단계',
                ),
        ),

        // Right: Next or Reset button
        SizedBox(
          width: 100,
          child: isLastStage
              ? FilledButton.icon(
                  onPressed: onReset,
                  icon: const Icon(Icons.refresh, size: 18),
                  label: Text(confirmReset ? '확인' : '처음으로'),
                  style: FilledButton.styleFrom(
                    backgroundColor: confirmReset
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.primary,
                  ),
                )
              : IconButton.outlined(
                  onPressed: onNext,
                  icon: const Icon(Icons.arrow_forward),
                  tooltip: '다음 단계',
                ),
        ),
      ],
    );
  }
}
