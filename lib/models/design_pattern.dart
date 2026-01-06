class DesignPattern {
  final String id;
  final String category; // 'creational', 'structural', 'behavioral'
  final String name;
  final String intent;
  final String summary;
  final String exampleCode; // Dart 코드 문자열
  final String? dartpadUrl;

  DesignPattern({
    required this.id,
    required this.category,
    required this.name,
    required this.intent,
    required this.summary,
    required this.exampleCode,
    this.dartpadUrl,
  });
}
