// Simple Singleton example
class Logger {
  Logger._internal();
  static final Logger _instance = Logger._internal();
  factory Logger() => _instance;
  final List<String> _logs = [];
  void log(String m) => _logs.add(m);
  List<String> get logs => List.unmodifiable(_logs);
}
