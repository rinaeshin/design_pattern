// State pattern
abstract class StateBase {
  String action();
}

class HappyState implements StateBase {
  @override
  String action() => 'I am happy';
}

class SadState implements StateBase {
  @override
  String action() => 'I am sad';
}

class Mood {
  StateBase _state;
  Mood(this._state);
  void set(StateBase s) => _state = s;
  String act() => _state.action();
}
