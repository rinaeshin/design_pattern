// Strategy pattern
abstract class Strategy {
  String run(String input);
}

class StrategyA implements Strategy {
  @override
  String run(String input) => 'A($input)';
}

class StrategyB implements Strategy {
  @override
  String run(String input) => 'B($input)';
}

class StrategyContext {
  Strategy strategy;
  StrategyContext(this.strategy);
  String exec(String i) => strategy.run(i);
}
