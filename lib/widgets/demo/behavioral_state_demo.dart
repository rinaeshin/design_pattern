import 'package:flutter/material.dart';
import '../../patterns/behavioral/state_impl.dart';

class BehavioralStateDemo extends StatefulWidget {
  const BehavioralStateDemo({super.key});
  @override
  State<BehavioralStateDemo> createState() => _BehavioralStateDemoState();
}

class _BehavioralStateDemoState extends State<BehavioralStateDemo> {
  late Mood mood;

  @override
  void initState() {
    super.initState();
    mood = Mood(HappyState());
  }

  void _happy() {
    setState(() => mood.set(HappyState()));
  }

  void _sad() {
    setState(() => mood.set(SadState()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('State Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Text('Mood: ${mood.act()}'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _happy, child: const Text('Happy')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: _sad, child: const Text('Sad')),
          ],
        ),
      ],
    );
  }
}
