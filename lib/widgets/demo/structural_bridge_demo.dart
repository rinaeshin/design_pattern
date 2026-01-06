import 'package:flutter/material.dart';
import '../../patterns/structural/bridge_impl.dart';

class StructuralBridgeDemo extends StatefulWidget {
  const StructuralBridgeDemo({super.key});
  @override
  State<StructuralBridgeDemo> createState() => _StructuralBridgeDemoState();
}

class _StructuralBridgeDemoState extends State<StructuralBridgeDemo> {
  String result = '';
  void _run() {
    final ab = Abstraction(ConcreteImplementorA());
    setState(() => result = ab.operation());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Bridge Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Bridge')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
