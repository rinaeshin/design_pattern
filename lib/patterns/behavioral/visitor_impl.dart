// Visitor example (simplified)
abstract class Visitor {
  void visit(Element e);
}

abstract class Element {
  void accept(Visitor v);
}

class ConcreteElement implements Element {
  final String name;
  ConcreteElement(this.name);
  @override
  void accept(Visitor v) => v.visit(this);
}

class ConcreteVisitor implements Visitor {
  @override
  void visit(Element e) {
    // do something
  }
}
