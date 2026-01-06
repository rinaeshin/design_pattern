// Facade example
class SubsystemA {
  String a() => 'A';
}

class SubsystemB {
  String b() => 'B';
}

class Facade {
  final SubsystemA a;
  final SubsystemB b;
  Facade(this.a, this.b);
  String op() => a.a() + b.b();
}
