import 'package:flutter/material.dart';
import '../../patterns/creational/prototype_impl.dart';

class CreationalPrototypeDemo extends StatefulWidget {
  const CreationalPrototypeDemo({super.key});
  @override
  State<CreationalPrototypeDemo> createState() =>
      _CreationalPrototypeDemoState();
}

class _CreationalPrototypeDemoState extends State<CreationalPrototypeDemo> {
  String result = '';
  void _clone() {
    final p = Prototype('origin');
    final c = p.clone();
    setState(() => result = 'origin=${p.toString()}, clone=${c.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Prototype Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _clone, child: const Text('Clone')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
