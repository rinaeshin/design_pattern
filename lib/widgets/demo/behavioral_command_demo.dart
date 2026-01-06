import 'package:flutter/material.dart';
import '../../patterns/behavioral/command_impl.dart';

class BehavioralCommandDemo extends StatefulWidget {
  const BehavioralCommandDemo({super.key});
  @override
  State<BehavioralCommandDemo> createState() => _BehavioralCommandDemoState();
}

class _BehavioralCommandDemoState extends State<BehavioralCommandDemo> {
  final Light light = Light();
  final Remote remote = Remote();

  void _on() {
    remote.slot = OnCommand(light);
    remote.press();
    setState(() {});
  }

  void _off() {
    remote.slot = OffCommand(light);
    remote.press();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Command Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Text('Light is: ${light.on ? 'ON' : 'OFF'}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _on, child: const Text('Turn On')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: _off, child: const Text('Turn Off')),
          ],
        ),
      ],
    );
  }
}
