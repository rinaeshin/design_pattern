import 'package:flutter/material.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  Widget _tile(
    BuildContext ctx,
    String title,
    VoidCallback onTap,
    Color color,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로비')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;
          if (isWide) {
            return Row(
              children: [
                Expanded(
                  child: _tile(
                    context,
                    '생성 패턴',
                    () => Navigator.pushNamed(context, '/category/creational'),
                    Colors.teal,
                  ),
                ),
                Expanded(
                  child: _tile(
                    context,
                    '구조 패턴',
                    () => Navigator.pushNamed(context, '/category/structural'),
                    Colors.indigo,
                  ),
                ),
                Expanded(
                  child: _tile(
                    context,
                    '행위 패턴',
                    () => Navigator.pushNamed(context, '/category/behavioral'),
                    Colors.deepOrange,
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: _tile(
                    context,
                    '생성 패턴',
                    () => Navigator.pushNamed(context, '/category/creational'),
                    Colors.teal,
                  ),
                ),
                Expanded(
                  child: _tile(
                    context,
                    '구조 패턴',
                    () => Navigator.pushNamed(context, '/category/structural'),
                    Colors.indigo,
                  ),
                ),
                Expanded(
                  child: _tile(
                    context,
                    '행위 패턴',
                    () => Navigator.pushNamed(context, '/category/behavioral'),
                    Colors.deepOrange,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
