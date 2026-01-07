import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/patterns.dart';
import '../data/animation_scenarios.dart';
import '../models/design_pattern.dart';
import '../widgets/animation/pattern_animation_widget.dart';

class PatternDetailPage extends StatefulWidget {
  final DesignPattern pattern;

  const PatternDetailPage({Key? key, required this.pattern}) : super(key: key);

  @override
  _PatternDetailPageState createState() => _PatternDetailPageState();
}

class _PatternDetailPageState extends State<PatternDetailPage> {
  @override
  Widget build(BuildContext context) {
    final hasAnimation = AnimationScenarios.hasAnimation(widget.pattern.id);
    final bottomBarHeight = 72.0; // Code 버튼 높이
    final safeBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(widget.pattern.name)),
      body: Stack(
        children: [
          // ✅ 문제 1 해결: 애니메이션 영역에 하단 여백 추가
          if (hasAnimation)
            Padding(
              padding: EdgeInsets.only(bottom: bottomBarHeight + safeBottom),
              child: PatternAnimationWidget(
                patternId: widget.pattern.id,
                stages: AnimationScenarios.getStages(widget.pattern.id),
              ),
            )
          else
            Padding(
              padding: EdgeInsets.only(bottom: bottomBarHeight + safeBottom),
              child: Center(
                child: Text(
                  '애니메이션이 준비되지 않았습니다',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),

          // Code 버튼을 하단에 고정
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: bottomBarHeight + safeBottom,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: safeBottom + 12,
              ),
              child: ElevatedButton.icon(
                onPressed: () => _showCodeDialog(context),
                icon: const Icon(Icons.code),
                label: const Text('Code'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCodeDialog(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    Widget content(BuildContext ctx) {
      return SizedBox(
        width: isMobile ? double.infinity : 800,
        height: isMobile ? MediaQuery.of(context).size.height * 0.8 : 600,
        child: Column(
          children: [
            // ✅ 문제 2 해결: 헤더를 별도로 분리하고 SafeArea 적용
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(ctx).pop(),
                    ),
                    const SizedBox(width: 8),
                    const Text('Code Viewer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),

            // 구분선
            const Divider(height: 1),
            const SizedBox(height: 12),

            // 본문 코드 영역 (스크롤 가능)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SelectableText(
                  widget.pattern.exampleCode,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 하단 Copy 버튼
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: widget.pattern.exampleCode),
                    );
                    Navigator.of(ctx).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('코드가 클립보드에 복사되었습니다')),
                    );
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text('Copy'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(44),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (ctx) => content(ctx),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => Dialog(
          insetPadding: const EdgeInsets.all(24.0),
          child: content(ctx),
        ),
      );
    }
  }
}
