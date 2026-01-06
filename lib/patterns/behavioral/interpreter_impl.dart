// Interpreter example (very simple)
abstract class Expression {
  int interpret();
}

class Number implements Expression {
  final int value;
  Number(this.value);
  @override
  int interpret() => value;
}

class Add implements Expression {
  final Expression left, right;
  Add(this.left, this.right);
  @override
  int interpret() => left.interpret() + right.interpret();
}
