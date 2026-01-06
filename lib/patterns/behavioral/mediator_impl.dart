// Mediator example
abstract class Mediator {
  void notify(Object sender, String event);
}

class ConcreteMediator implements Mediator {
  final List<Colleague> colleagues = [];
  void add(Colleague c) {
    colleagues.add(c);
    c.mediator = this;
  }

  @override
  void notify(Object sender, String event) {
    for (var c in colleagues) {
      if (c != sender) c.receive(event);
    }
  }
}

abstract class Colleague {
  late Mediator mediator;
  void send(String event) => mediator.notify(this, event);
  void receive(String event) {}
}
