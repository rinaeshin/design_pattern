// Memento example
class Memento {
  final String state;
  Memento(this.state);
}

class Originator {
  String _state = '';
  void setState(String s) {
    _state = s;
  }

  Memento save() => Memento(_state);
  void restore(Memento m) {
    _state = m.state;
  }

  String get state => _state;
}
