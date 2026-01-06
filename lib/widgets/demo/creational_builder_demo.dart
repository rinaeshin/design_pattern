import 'package:flutter/material.dart';
import '../../patterns/creational/builder_impl.dart';

class CreationalBuilderDemo extends StatefulWidget {
  const CreationalBuilderDemo({super.key});
  @override
  State<CreationalBuilderDemo> createState() => _CreationalBuilderDemoState();
}

class _CreationalBuilderDemoState extends State<CreationalBuilderDemo> {
  String result = '';
  final ConcreteBuilder _builder = ConcreteBuilder();

  void _build() {
    final director = Director(_builder);
    final p = director.construct();
    setState(() {
      result = p.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Builder Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _build, child: const Text('Build Product')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
