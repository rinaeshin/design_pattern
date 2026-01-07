import 'package:flutter/material.dart';
import '../../patterns/behavioral/iterator_impl.dart';

class BehavioralIteratorDemo extends StatefulWidget {
  const BehavioralIteratorDemo({super.key});
  @override
  State<BehavioralIteratorDemo> createState() => _BehavioralIteratorDemoState();
}

class _BehavioralIteratorDemoState extends State<BehavioralIteratorDemo> {
  String result = '';

  /// Trigger the iteration process
  void _run() {
    final list = MyList<int>([1, 2, 3]);
    final it = list.iterator();
    final items = <int>[];
    while (it.moveNext()) {
      items.add(it.current); // Collect current item while iterating
    }
    setState(() => result = items.join(', '));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Iterator Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Iterate')),

        /// Button to start iteration
        const SizedBox(height: 12),
        Text('Result: $result'),

        /// Display the result after iteration
      ],
    );
  }
}
