import 'package:flutter/material.dart';
import '../../patterns/behavioral/observer_impl.dart';

class BehavioralObserverDemo extends StatefulWidget {
  const BehavioralObserverDemo({super.key});
  @override
  State<BehavioralObserverDemo> createState() => _BehavioralObserverDemoState();
}

class _BehavioralObserverDemoState extends State<BehavioralObserverDemo> {
  final Subject subj = Subject();
  int val = 0;

  @override
  void initState() {
    super.initState();
    subj.add((v) {
      setState(() => val = v); // Update the state on value change
    });
  }

  /// Increment the subject's value
  void _inc() {
    subj.inc();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Observer Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Text('Value: $val'),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _inc,
          child: const Text('Increment'),
        ), // Trigger value increment
      ],
    );
  }
}
