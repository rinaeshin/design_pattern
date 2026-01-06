import 'package:flutter/material.dart';
import '../../patterns/creational/singleton_impl.dart';

class CreationalSingletonDemo extends StatefulWidget {
  const CreationalSingletonDemo({super.key});
  @override
  State<CreationalSingletonDemo> createState() =>
      _CreationalSingletonDemoState();
}

class _CreationalSingletonDemoState extends State<CreationalSingletonDemo> {
  void _log() {
    Logger().log('log at ${DateTime.now()}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final logs = Logger().logs;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Singleton Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _log, child: const Text('Append Log')),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView(children: logs.map((e) => Text(e)).toList()),
        ),
      ],
    );
  }
}
