import 'package:flutter/material.dart';
import '../../patterns/structural/flyweight_impl.dart';

class StructuralFlyweightDemo extends StatefulWidget {
  const StructuralFlyweightDemo({super.key});
  @override
  State<StructuralFlyweightDemo> createState() =>
      _StructuralFlyweightDemoState();
}

class _StructuralFlyweightDemoState extends State<StructuralFlyweightDemo> {
  String result = '';
  void _run() {
    final factory = FlyweightFactory();
    final a = factory.get('X');
    final b = factory.get('X');
    setState(
      () => result = 'a==b: ${identical(a, b)}, op: ${a.op('external')}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Flyweight Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Flyweight')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
