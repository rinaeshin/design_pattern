// Bridge example
abstract class Implementor {
  String operation();
}

class ConcreteImplementorA implements Implementor {
  @override
  String operation() => 'ImplA';
}

class Abstraction {
  final Implementor implementor;
  Abstraction(this.implementor);
  String operation() => implementor.operation();
}
