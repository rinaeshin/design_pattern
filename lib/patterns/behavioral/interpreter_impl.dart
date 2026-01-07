// Interpreter pattern
abstract class Expression {
  int interpret(); // Method to interpret the expression
}

class Number implements Expression {
  final int value;
  Number(this.value);
  @override
  int interpret() => value; // Interpret the number value
}

class Add implements Expression {
  final Expression left;
  final Expression right;

  Add(this.left, this.right);
  @override
  int interpret() => left.interpret() + right.interpret(); // Interpret by adding left and right expressions
}
