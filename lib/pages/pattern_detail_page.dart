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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Demo'),
              Tab(text: 'Code'),
              Tab(text: 'Overview'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Demo tab
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: _buildDemoArea(context),
            ),

            // Code tab
            Padding(
              padding: const EdgeInsets.all(12.0),
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
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: pattern.exampleCode),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('코드가 클립보드에 복사되었습니다')),
                          );
                        },
                        icon: const Icon(Icons.copy),
                        label: const Text('Copy'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Optional: open DartPad if url exists
                        },
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('Open'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Overview tab
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('의도', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(pattern.intent),
                    const SizedBox(height: 16),
                    Text('요약', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(pattern.summary),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemoArea(BuildContext context) {
    // Creational demos
    if (pattern.id == 'singleton') return const CreationalSingletonDemo();
    if (pattern.id == 'factory') return const CreationalFactoryDemo();
    if (pattern.id == 'abstract_factory')
      return const CreationalAbstractFactoryDemo();
    if (pattern.id == 'builder') return const CreationalBuilderDemo();
    if (pattern.id == 'prototype') return const CreationalPrototypeDemo();

    // Structural demos
    if (pattern.id == 'adapter') return const StructuralAdapterDemo();
    if (pattern.id == 'bridge') return const StructuralBridgeDemo();
    if (pattern.id == 'composite') return const StructuralCompositeDemo();
    if (pattern.id == 'decorator') return const StructuralDecoratorDemo();
    if (pattern.id == 'facade') return const StructuralFacadeDemo();
    if (pattern.id == 'flyweight') return const StructuralFlyweightDemo();
    if (pattern.id == 'proxy') return const StructuralProxyDemo();

    // Behavioral demos
    if (pattern.id == 'command') return const BehavioralCommandDemo();
    if (pattern.id == 'observer') return const BehavioralObserverDemo();
    if (pattern.id == 'strategy') return const BehavioralStrategyDemo();
    if (pattern.id == 'state') return const BehavioralStateDemo();
    if (pattern.id == 'template') return const BehavioralTemplateDemo();
    if (pattern.id == 'iterator') return const BehavioralIteratorDemo();
    if (pattern.id == 'mediator') return const BehavioralMediatorDemo();
    if (pattern.id == 'memento') return const BehavioralMementoDemo();
    if (pattern.id == 'chain') return const BehavioralChainDemo();
    if (pattern.id == 'visitor') return const BehavioralVisitorDemo();
    if (pattern.id == 'interpreter') return const BehavioralInterpreterDemo();

    return const Center(child: Text('데모가 준비되지 않았습니다.'));
  }
}
