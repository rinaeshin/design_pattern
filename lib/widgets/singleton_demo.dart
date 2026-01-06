import 'package:flutter/material.dart';

class SingletonCounter {
  SingletonCounter._internal();
  static final SingletonCounter _instance = SingletonCounter._internal();
  factory SingletonCounter() => _instance;

  final ValueNotifier<int> count = ValueNotifier<int>(0);
  void increment() => count.value++;
}

class SingletonDemoPage extends StatelessWidget {
  final SingletonCounter counter = SingletonCounter();
  SingletonDemoPage({super.key});

  Widget panel(String title) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            ValueListenableBuilder<int>(
              valueListenable: counter.count,
              builder: (context, value, child) => Text(
                '$value',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: counter.increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return Row(
            children: [
              Expanded(child: panel('패널 A')),
              Expanded(child: panel('패널 B')),
            ],
          );
        } else {
          return ListView(children: [panel('패널 A'), panel('패널 B')]);
        }
      },
    );
  }
}
