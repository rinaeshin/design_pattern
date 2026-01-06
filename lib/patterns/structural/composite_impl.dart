// Composite example
abstract class Component {
  void operation();
}

class Leaf implements Component {
  final String name;
  Leaf(this.name);
  @override
  void operation() => print('Leaf $name');
}

class Composite implements Component {
  final List<Component> children = [];
  @override
  void operation() {
    for (var c in children) {
      c.operation();
    }
  }

  void add(Component c) => children.add(c);
}
