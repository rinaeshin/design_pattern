// Composite example
abstract class Component {
  String operation();
}

class Leaf implements Component {
  final String name;
  Leaf(this.name);
  @override
  String operation() => 'Leaf $name';
}

class Composite implements Component {
  final List<Component> children = [];
  @override
  String operation() {
    final results = <String>[];
    for (var c in children) {
      results.add(c.operation());
    }
    return results.join(', ');
  }

  void add(Component c) => children.add(c);
}
