import 'package:flutter/material.dart';
import '../models/design_pattern.dart';
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

class PatternDetailPage extends StatelessWidget {
  final DesignPattern pattern;
  const PatternDetailPage({required this.pattern, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pattern.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_new),
            tooltip: 'DartPad 열기',
            onPressed: pattern.dartpadUrl == null
                ? null
                : () {
                    // Web에서 새 탭으로 DartPad 열기 가능
                  },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _buildDemoArea(context),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () => _showCodeDialog(context),
                icon: const Icon(Icons.code),
                label: const Text('Code'),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () => _showOverviewDialog(context),
                icon: const Icon(Icons.info_outline),
                label: const Text('Overview'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDemoArea(BuildContext context) {
    // Creational demos
    if (pattern.id == 'singleton') {
      return const CreationalSingletonDemo();
    }
    if (pattern.id == 'factory') {
      return const CreationalFactoryDemo();
    }
    if (pattern.id == 'abstract_factory') {
      return const CreationalAbstractFactoryDemo();
    }
    if (pattern.id == 'builder') {
      return const CreationalBuilderDemo();
    }
    if (pattern.id == 'prototype') {
      return const CreationalPrototypeDemo();
    }

    // Structural demos
    if (pattern.id == 'adapter') {
      return const StructuralAdapterDemo();
    }
    if (pattern.id == 'bridge') {
      return const StructuralBridgeDemo();
    }
    if (pattern.id == 'composite') {
      return const StructuralCompositeDemo();
    }
    if (pattern.id == 'decorator') {
      return const StructuralDecoratorDemo();
    }
    if (pattern.id == 'facade') {
      return const StructuralFacadeDemo();
    }
    if (pattern.id == 'flyweight') {
      return const StructuralFlyweightDemo();
    }
    if (pattern.id == 'proxy') {
      return const StructuralProxyDemo();
    }

    // Behavioral demos
    if (pattern.id == 'command') {
      return const BehavioralCommandDemo();
    }
    if (pattern.id == 'observer') {
      return const BehavioralObserverDemo();
    }
    if (pattern.id == 'strategy') {
      return const BehavioralStrategyDemo();
    }
    if (pattern.id == 'state') {
      return const BehavioralStateDemo();
    }
    if (pattern.id == 'template') {
      return const BehavioralTemplateDemo();
    }
    if (pattern.id == 'iterator') {
      return const BehavioralIteratorDemo();
    }
    if (pattern.id == 'mediator') {
      return const BehavioralMediatorDemo();
    }
    if (pattern.id == 'memento') {
      return const BehavioralMementoDemo();
    }
    if (pattern.id == 'chain') {
      return const BehavioralChainDemo();
    }
    if (pattern.id == 'visitor') {
      return const BehavioralVisitorDemo();
    }
    if (pattern.id == 'interpreter') {
      return const BehavioralInterpreterDemo();
    }

    return const Center(child: Text('데모가 준비되지 않았습니다.'));
  }

  void _showCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          insetPadding: const EdgeInsets.all(24.0),
          child: SizedBox(
            width: 800,
            height: 600,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: SelectableText(
                            pattern.exampleCode,
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
                      Clipboard.setData(
                        ClipboardData(text: pattern.exampleCode),
                      );
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
          ),
        );
      },
    );
  }

  void _showOverviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          insetPadding: const EdgeInsets.all(24.0),
          child: SizedBox(
            width: 700,
            height: 400,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '의도',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(pattern.intent),
                        const SizedBox(height: 16),
                        Text(
                          '요약',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(pattern.summary),
                      ],
                    ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
