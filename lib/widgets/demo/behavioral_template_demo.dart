import 'package:flutter/material.dart';
import '../../patterns/behavioral/template_impl.dart';

class BehavioralTemplateDemo extends StatefulWidget {
  const BehavioralTemplateDemo({super.key});
  @override
  State<BehavioralTemplateDemo> createState() => _BehavioralTemplateDemoState();
}

class _BehavioralTemplateDemoState extends State<BehavioralTemplateDemo> {
  String result = '';

  /// Execute the football game
  void _football() {
    final g = Football();
    g.play(); // Play using the Football template
    setState(() => result = 'Played Football (see console)');
  }

  /// Execute the cricket game
  void _cricket() {
    final g = Cricket();
    g.play(); // Play using the Cricket template
    setState(() => result = 'Played Cricket (see console)');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Template Method Demo',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _football,
          child: const Text('Play Football'), // Button to play football
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _cricket,
          child: const Text('Play Cricket'),
        ), // Button to play cricket
        const SizedBox(height: 12),
        Text('Result: $result'), // Display the last action result
      ],
    );
  }
}
