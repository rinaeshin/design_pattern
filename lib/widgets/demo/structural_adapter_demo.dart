import 'package:flutter/material.dart';
import '../../patterns/structural/adapter_impl.dart';

class StructuralAdapterDemo extends StatefulWidget {
  const StructuralAdapterDemo({super.key});

  @override
  State<StructuralAdapterDemo> createState() => _StructuralAdapterDemoState();
}

class _StructuralAdapterDemoState extends State<StructuralAdapterDemo> {
  String result = '';
  void _run() {
    final a = Adapter(Adaptee());
    setState(() => result = a.request());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Adapter Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Adapter')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
