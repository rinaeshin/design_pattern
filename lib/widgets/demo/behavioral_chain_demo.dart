import 'package:flutter/material.dart';
import '../../patterns/behavioral/chain_impl.dart';

class BehavioralChainDemo extends StatefulWidget {
  const BehavioralChainDemo({super.key});
  @override
  State<BehavioralChainDemo> createState() => _BehavioralChainDemoState();
}

class _BehavioralChainDemoState extends State<BehavioralChainDemo> {
  String result = '';
  void _run() {
    final a = ConcreteHandlerA();
    final b = ConcreteHandlerA();
    a.next = b;
    a.handle('B'); // Stage 2: Request passed along chain
    setState(() => result = 'Request passed along chain (see handlers)');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Chain of Responsibility Demo',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Chain')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
