import 'package:flutter/material.dart';
import '../models/design_pattern.dart';

class PatternCard extends StatelessWidget {
  final DesignPattern pattern;
  const PatternCard({required this.pattern, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pattern.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    pattern.intent,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pattern/${pattern.id}');
              },
              child: const Text('자세히'),
            ),
          ],
        ),
      ),
    );
  }
}
