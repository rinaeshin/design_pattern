import 'package:flutter/material.dart';
import '../../patterns/structural/composite_impl.dart';

class StructuralCompositeDemo extends StatefulWidget {
  const StructuralCompositeDemo({super.key});
  @override
  State<StructuralCompositeDemo> createState() =>
      _StructuralCompositeDemoState();
}

class _StructuralCompositeDemoState extends State<StructuralCompositeDemo> {
  String result = '';
  void _run() {
    final root = Composite();
    root.add(Leaf('A'));
    final sub = Composite();
    sub.add(Leaf('B1'));
    sub.add(Leaf('B2'));
    root.add(sub);
    // capture output by calling operation and display it
    final output = root.operation();
    setState(() => result = 'Output: $output');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Composite Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Composite')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
