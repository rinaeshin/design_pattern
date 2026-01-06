import 'package:flutter/material.dart';
import '../../patterns/behavioral/mediator_impl.dart';

class BehavioralMediatorDemo extends StatefulWidget {
  const BehavioralMediatorDemo({super.key});
  @override
  State<BehavioralMediatorDemo> createState() => _BehavioralMediatorDemoState();
}

class DemoColleague extends Colleague {
  final String name;
  DemoColleague(this.name);
  @override
  void receive(String event) {
    /* no-op for demo, could update UI */
  }
}

class _BehavioralMediatorDemoState extends State<BehavioralMediatorDemo> {
  String result = '';
  void _run() {
    final m = ConcreteMediator();
    final a = DemoColleague('A');
    final b = DemoColleague('B');
    m.add(a);
    m.add(b);
    a.send('hello');
    setState(() => result = 'Sent from A to others (see mediator behavior)');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Mediator Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Mediator')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
