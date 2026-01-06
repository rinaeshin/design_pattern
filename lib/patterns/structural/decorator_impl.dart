// Decorator example
abstract class ComponentS {
  String operation();
}

class ConcreteComponent implements ComponentS {
  @override
  String operation() => 'core';
}

class DecoratorS implements ComponentS {
  final ComponentS wrap;
  DecoratorS(this.wrap);
  @override
  String operation() => '${wrap.operation()} + added';
}
