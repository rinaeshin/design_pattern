import 'package:flutter/material.dart';
import '../../patterns/behavioral/interpreter_impl.dart';

class BehavioralInterpreterDemo extends StatefulWidget {
  const BehavioralInterpreterDemo({super.key});
  @override
  State<BehavioralInterpreterDemo> createState() =>
      _BehavioralInterpreterDemoState();
}

class _BehavioralInterpreterDemoState extends State<BehavioralInterpreterDemo> {
  String result = '';
  void _run() {
    final expr = Add(Number(2), Number(3));
    setState(() => result = expr.interpret().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Interpreter Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Interpreter')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
