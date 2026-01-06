import 'package:flutter/material.dart';
import '../data/patterns.dart';
import '../pages/pattern_detail_page.dart';
import '../models/design_pattern.dart';

class CategoryPage extends StatelessWidget {
  final String category; // 'creational'|'structural'|'behavioral'
  const CategoryPage({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final items = patterns.where((p) => p.category == category).toList();
    final title = category == 'creational'
        ? '생성 패턴'
        : category == 'structural'
        ? '구조 패턴'
        : '행위 패턴';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final DesignPattern p = items[index];
          return ListTile(
            title: Text(p.name),
            subtitle: Text(p.intent),
            trailing: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PatternDetailPage(pattern: p),
                ),
              ),
              child: const Text('보기'),
            ),
          );
        },
      ),
    );
  }
}
