import 'package:flutter/material.dart';
import '../data/patterns.dart';
import '../widgets/pattern_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 분류별로 패턴 필터링
    final creational = patterns
        .where((p) => p.category == 'creational')
        .toList();
    final structural = patterns
        .where((p) => p.category == 'structural')
        .toList();
    final behavioral = patterns
        .where((p) => p.category == 'behavioral')
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('디자인 패턴 데모')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1200) {
            // 3-컬럼
            return Row(
              children: [
                Expanded(
                  child: _CategoryColumn(title: '생성 패턴', items: creational),
                ),
                Expanded(
                  child: _CategoryColumn(title: '구조 패턴', items: structural),
                ),
                Expanded(
                  child: _CategoryColumn(title: '행위 패턴', items: behavioral),
                ),
              ],
            );
          } else if (constraints.maxWidth >= 800) {
            // 2-컬럼
            return Row(
              children: [
                Expanded(
                  child: _CategoryColumn(title: '생성 패턴', items: creational),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: _CategoryColumn(
                          title: '구조 패턴',
                          items: structural,
                        ),
                      ),
                      Expanded(
                        child: _CategoryColumn(
                          title: '행위 패턴',
                          items: behavioral,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            // 1-컬럼(모바일)
            return ListView(
              children: [
                _CategoryColumn(title: '생성 패턴', items: creational),
                _CategoryColumn(title: '구조 패턴', items: structural),
                _CategoryColumn(title: '행위 패턴', items: behavioral),
              ],
            );
          }
        },
      ),
    );
  }
}

class _CategoryColumn extends StatelessWidget {
  final String title;
  final List items;
  const _CategoryColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3, // 카드 높이 제어: 너비 대비 비율
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final pattern = items[index];
              return PatternCard(pattern: pattern);
            },
          ),
        ),
      ],
    );
  }
}
