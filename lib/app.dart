import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/pattern_detail_page.dart';
import 'pages/lobby_page.dart';
import 'pages/category_page.dart';
import 'data/patterns.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '디자인 패턴 데모',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => const LobbyPage(),
        '/home': (context) => const HomePage(),
      },
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '');
        if (uri.pathSegments.isNotEmpty) {
          if (uri.pathSegments.first == 'pattern') {
            final id = uri.pathSegments.length > 1 ? uri.pathSegments[1] : '';
            final pattern = patterns.firstWhere(
              (p) => p.id == id,
              orElse: () => patterns[0],
            );
            return MaterialPageRoute(
              builder: (_) => PatternDetailPage(pattern: pattern),
            );
          }
          if (uri.pathSegments.first == 'category') {
            final cat = uri.pathSegments.length > 1 ? uri.pathSegments[1] : '';
            return MaterialPageRoute(
              builder: (_) => CategoryPage(category: cat),
            );
          }
        }
        return null;
      },
    );
  }
}
