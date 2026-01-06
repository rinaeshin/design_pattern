import 'package:flutter/material.dart';
import '../../patterns/behavioral/memento_impl.dart';

class BehavioralMementoDemo extends StatefulWidget {
  const BehavioralMementoDemo({super.key});
  @override
  State<BehavioralMementoDemo> createState() => _BehavioralMementoDemoState();
}

class _BehavioralMementoDemoState extends State<BehavioralMementoDemo> {
  final Originator origin = Originator();
  Memento? saved;

  void _setState() {
    origin.setState('state@${DateTime.now().millisecondsSinceEpoch}');
    setState(() {});
  }

  void _save() {
    saved = origin.save();
    setState(() {});
  }

  void _restore() {
    if (saved != null) {
      origin.restore(saved!);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Memento Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Text('Current: ${origin.state}'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _setState,
              child: const Text('Change State'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: _save, child: const Text('Save')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: _restore, child: const Text('Restore')),
          ],
        ),
      ],
    );
  }
}
