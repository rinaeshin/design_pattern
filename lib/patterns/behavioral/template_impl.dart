// Template Method pattern
abstract class Game {
  void initialize();
  void startPlay();
  void endPlay();
  void play() {
    initialize();
    startPlay();
    endPlay();
  }
}

class Football extends Game {
  @override
  void initialize() {}
  @override
  void startPlay() {}
  @override
  void endPlay() {}
}

class Cricket extends Game {
  @override
  void initialize() {}
  @override
  void startPlay() {}
  @override
  void endPlay() {}
}
