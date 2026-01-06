import 'package:flutter/material.dart';
import '../../patterns/structural/decorator_impl.dart';

class StructuralDecoratorDemo extends StatefulWidget {
  const StructuralDecoratorDemo({super.key});
  @override
  State<StructuralDecoratorDemo> createState() =>
      _StructuralDecoratorDemoState();
}

class _StructuralDecoratorDemoState extends State<StructuralDecoratorDemo> {
  String result = '';
  void _run() {
    final core = ConcreteComponent();
    final decorated = DecoratorS(core);
    setState(() => result = decorated.operation());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Decorator Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Decorator')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
