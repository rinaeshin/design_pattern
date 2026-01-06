import 'package:flutter/material.dart';
import '../../patterns/creational/factory_impl.dart';

class CreationalFactoryDemo extends StatefulWidget {
  const CreationalFactoryDemo({super.key});

  @override
  State<CreationalFactoryDemo> createState() => _CreationalFactoryDemoState();
}

class _CreationalFactoryDemoState extends State<CreationalFactoryDemo> {
  String result = '';

  void _create(String t) {
    final p = SimpleFactory.create(t);
    setState(() {
      result = p.name();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Factory Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _create('A'),
              child: const Text('Create A'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _create('B'),
              child: const Text('Create B'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
