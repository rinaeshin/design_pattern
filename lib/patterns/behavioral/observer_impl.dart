// Observer pattern
class Subject {
  final List<void Function(int)> _listeners = [];
  int _v = 0;
  void add(void Function(int) l) => _listeners.add(l);
  void inc() {
    _v++;
    for (final l in _listeners) {
      l(_v);
    }
  }
}
