import 'package:flutter/material.dart';
import '../../patterns/behavioral/strategy_impl.dart';

class BehavioralStrategyDemo extends StatefulWidget {
  const BehavioralStrategyDemo({super.key});
  @override
  State<BehavioralStrategyDemo> createState() => _BehavioralStrategyDemoState();
}

class _BehavioralStrategyDemoState extends State<BehavioralStrategyDemo> {
  String input = 'data';
  String result = '';
  late StrategyContext ctx;

  @override
  void initState() {
    super.initState();
    ctx = StrategyContext(StrategyA());
  }

  void _setA() {
    setState(() => ctx.strategy = StrategyA());
  }

  void _setB() {
    setState(() => ctx.strategy = StrategyB());
  }

  void _run() {
    setState(() => result = ctx.exec(input));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Strategy Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _setA, child: const Text('Use A')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: _setB, child: const Text('Use B')),
          ],
        ),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
