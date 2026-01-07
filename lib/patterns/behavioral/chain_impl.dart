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
      // Handle request type A
    } else {
      super.handle(req);
    }
  }
}

// Stage 1: Set up concrete handlers and chain them
// Each handler processes its own request type and passes it along if necessary.
