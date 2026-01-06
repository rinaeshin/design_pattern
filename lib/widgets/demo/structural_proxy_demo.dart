import 'package:flutter/material.dart';
import '../../patterns/structural/proxy_impl.dart';

class StructuralProxyDemo extends StatefulWidget {
  const StructuralProxyDemo({super.key});
  @override
  State<StructuralProxyDemo> createState() => _StructuralProxyDemoState();
}

class _StructuralProxyDemoState extends State<StructuralProxyDemo> {
  String result = '';
  void _run() {
    final proxy = ProxySubject(RealSubject());
    setState(() => result = proxy.request());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Proxy Demo', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _run, child: const Text('Run Proxy')),
        const SizedBox(height: 12),
        Text('Result: $result'),
      ],
    );
  }
}
