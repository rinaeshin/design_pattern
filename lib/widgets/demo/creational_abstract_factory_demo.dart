import 'package:flutter/material.dart';
import '../../patterns/creational/abstract_factory_impl.dart';

class CreationalAbstractFactoryDemo extends StatefulWidget {
  const CreationalAbstractFactoryDemo({super.key});

  @override
  State<CreationalAbstractFactoryDemo> createState() =>
      _CreationalAbstractFactoryDemoState();
}

class _CreationalAbstractFactoryDemoState
    extends State<CreationalAbstractFactoryDemo> {
  String result = '';
  late GUIFactory factory;

  void _setFactory(bool win) {
    factory = win ? WindowsFactory() : MacFactory();
    setState(() {
      result = '';
    });
  }

  void _render() {
    final b = factory.createButton();
    setState(() {
      result = b.render();
    });
  }

  @override
  void initState() {
    super.initState();
    factory = WindowsFactory();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Abstract Factory Demo',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _setFactory(true),
              child: const Text('Windows Factory'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _setFactory(false),
              child: const Text('Mac Factory'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _render, child: const Text('Render Button')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
