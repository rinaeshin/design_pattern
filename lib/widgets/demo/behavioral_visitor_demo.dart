import 'package:flutter/material.dart';
import '../../patterns/behavioral/visitor_impl.dart';

class BehavioralVisitorDemo extends StatefulWidget {
  const BehavioralVisitorDemo({super.key});
  @override
  State<BehavioralVisitorDemo> createState() => _BehavioralVisitorDemoState();
}

class _BehavioralVisitorDemoState extends State<BehavioralVisitorDemo> {
  String result = '';
  void _run() {
    final elem = ConcreteElement('E');
    final visitor = ConcreteVisitor();
    elem.accept(visitor);
    setState(() => result = 'Visitor executed on element');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Visitor Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Visitor')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
