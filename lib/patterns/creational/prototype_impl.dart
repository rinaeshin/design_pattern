// Simple Prototype example
class Prototype {
  String field;
  Prototype(this.field);
  Prototype clone() => Prototype(field);
  @override
  String toString() => 'Prototype(field: $field)';
}
