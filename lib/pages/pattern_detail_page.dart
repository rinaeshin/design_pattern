import 'package:flutter/material.dart';
import '../models/design_pattern.dart';
import '../models/view_mode.dart';
import '../data/animation_scenarios.dart';
import '../widgets/animation/pattern_animation_widget.dart';
import '../widgets/demo/creational_singleton_demo.dart';
import '../widgets/demo/creational_factory_demo.dart';
import '../widgets/demo/creational_builder_demo.dart';
import '../widgets/demo/creational_prototype_demo.dart';
import '../widgets/demo/creational_abstract_factory_demo.dart';
import 'package:flutter/services.dart';
import '../widgets/demo/structural_adapter_demo.dart';
import '../widgets/demo/structural_bridge_demo.dart';
import '../widgets/demo/structural_composite_demo.dart';
import '../widgets/demo/structural_decorator_demo.dart';
import '../widgets/demo/structural_facade_demo.dart';
import '../widgets/demo/structural_flyweight_demo.dart';
import '../widgets/demo/structural_proxy_demo.dart';
import '../widgets/demo/behavioral_command_demo.dart';
import '../widgets/demo/behavioral_observer_demo.dart';
import '../widgets/demo/behavioral_strategy_demo.dart';
import '../widgets/demo/behavioral_state_demo.dart';
import '../widgets/demo/behavioral_template_demo.dart';
import '../widgets/demo/behavioral_iterator_demo.dart';
import '../widgets/demo/behavioral_mediator_demo.dart';
import '../widgets/demo/behavioral_memento_demo.dart';
import '../widgets/demo/behavioral_chain_demo.dart';
import '../widgets/demo/behavioral_visitor_demo.dart';
import '../widgets/demo/behavioral_interpreter_demo.dart';

class PatternDetailPage extends StatefulWidget {
  final DesignPattern pattern;
  const PatternDetailPage({required this.pattern, super.key});

  @override
  State<PatternDetailPage> createState() => _PatternDetailPageState();
}

class _PatternDetailPageState extends State<PatternDetailPage> {
  ViewMode _selectedMode = ViewMode.developer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pattern.name)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildOverviewSection(context),
            const SizedBox(height: 16),
            _buildModeToggle(context),
            const SizedBox(height: 12),
            Expanded(child: _buildContentArea(context)),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _showCodeDialog(context),
              child: const Text('Code'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDemoArea(BuildContext context) {
    // Creational demos
    if (widget.pattern.id == 'singleton') {
      return const CreationalSingletonDemo();
    }
    if (widget.pattern.id == 'factory') {
      return const CreationalFactoryDemo();
    }
    if (widget.pattern.id == 'abstract_factory') {
      return const CreationalAbstractFactoryDemo();
    }
    if (widget.pattern.id == 'builder') {
      return const CreationalBuilderDemo();
    }
    if (widget.pattern.id == 'prototype') {
      return const CreationalPrototypeDemo();
    }

    // Structural demos
    if (widget.pattern.id == 'adapter') {
      return const StructuralAdapterDemo();
    }
    if (widget.pattern.id == 'bridge') {
      return const StructuralBridgeDemo();
    }
    if (widget.pattern.id == 'composite') {
      return const StructuralCompositeDemo();
    }
    if (widget.pattern.id == 'decorator') {
      return const StructuralDecoratorDemo();
    }
    if (widget.pattern.id == 'facade') {
      return const StructuralFacadeDemo();
    }
    if (widget.pattern.id == 'flyweight') {
      return const StructuralFlyweightDemo();
    }
    if (widget.pattern.id == 'proxy') {
      return const StructuralProxyDemo();
    }

    // Behavioral demos
    if (widget.pattern.id == 'command') {
      return const BehavioralCommandDemo();
    }
    if (widget.pattern.id == 'observer') {
      return const BehavioralObserverDemo();
    }
    if (widget.pattern.id == 'strategy') {
      return const BehavioralStrategyDemo();
    }
    if (widget.pattern.id == 'state') {
      return const BehavioralStateDemo();
    }
    if (widget.pattern.id == 'template') {
      return const BehavioralTemplateDemo();
    }
    if (widget.pattern.id == 'iterator') {
      return const BehavioralIteratorDemo();
    }
    if (widget.pattern.id == 'mediator') {
      return const BehavioralMediatorDemo();
    }
    if (widget.pattern.id == 'memento') {
      return const BehavioralMementoDemo();
    }
    if (widget.pattern.id == 'chain') {
      return const BehavioralChainDemo();
    }
    if (widget.pattern.id == 'visitor') {
      return const BehavioralVisitorDemo();
    }
    if (widget.pattern.id == 'interpreter') {
      return const BehavioralInterpreterDemo();
    }

    return const Center(child: Text('데모가 준비되지 않았습니다.'));
  }

  void _showCodeDialog(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    Widget content(BuildContext ctx) => SizedBox(
      width: isMobile ? double.infinity : 800,
      height: isMobile ? MediaQuery.of(context).size.height * 0.8 : 600,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: SelectableText(
                      widget.pattern.exampleCode,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: ElevatedButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: widget.pattern.exampleCode));
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('코드가 클립보드에 복사되었습니다')),
                );
              },
              icon: const Icon(Icons.copy),
              label: const Text('Copy'),
            ),
          ),
        ],
      ),
    );

    if (isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => SafeArea(child: content(ctx)),
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

  Widget _buildOverviewSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 의도 섹션
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '의도',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.pattern.intent,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          // 요약 섹션
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.article_outlined,
                size: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '요약',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.pattern.summary,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModeToggle(BuildContext context) {
    // Only show toggle if animation exists for this pattern
    if (!AnimationScenarios.hasAnimation(widget.pattern.id)) {
      return const SizedBox.shrink();
    }

    return Center(
      child: SegmentedButton<ViewMode>(
        segments: const [
          ButtonSegment(
            value: ViewMode.developer,
            label: Text('개발자용'),
            icon: Icon(Icons.code, size: 18),
          ),
          ButtonSegment(
            value: ViewMode.nonDeveloper,
            label: Text('시각화'),
            icon: Icon(Icons.play_circle_outline, size: 18),
          ),
        ],
        selected: {_selectedMode},
        onSelectionChanged: (Set<ViewMode> newSelection) {
          setState(() {
            _selectedMode = newSelection.first;
          });
        },
      ),
    );
  }

  Widget _buildContentArea(BuildContext context) {
    if (_selectedMode == ViewMode.nonDeveloper &&
        AnimationScenarios.hasAnimation(widget.pattern.id)) {
      return PatternAnimationWidget(
        patternId: widget.pattern.id,
        stages: AnimationScenarios.getStages(widget.pattern.id),
      );
    }

    // Developer mode: show existing demos
    return _buildDemoArea(context);
  }
}
