// Adapter example
class Adaptee {
  String specificRequest() => 'specific_result';
}

class Target {
  String request() => 'default';
}

class Adapter implements Target {
  final Adaptee adaptee;
  Adapter(this.adaptee);
  @override
  String request() => adaptee.specificRequest();
}
