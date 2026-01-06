import 'package:flutter/material.dart';
import '../../patterns/structural/facade_impl.dart';

class StructuralFacadeDemo extends StatefulWidget {
  const StructuralFacadeDemo({super.key});
  @override
  State<StructuralFacadeDemo> createState() => _StructuralFacadeDemoState();
}

class _StructuralFacadeDemoState extends State<StructuralFacadeDemo> {
  String result = '';
  void _run() {
    final f = Facade(SubsystemA(), SubsystemB());
    setState(() => result = f.op());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Facade Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Facade')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
