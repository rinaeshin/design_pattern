// Chain of Responsibility example
abstract class Handler {
  Handler? next;
  void handle(String req) {
    if (next != null) next!.handle(req);
  }
}

class ConcreteHandlerA extends Handler {
  @override
  void handle(String req) {
    if (req == 'A') {
      // handle
    } else {
      super.handle(req);
    }
  }
}
