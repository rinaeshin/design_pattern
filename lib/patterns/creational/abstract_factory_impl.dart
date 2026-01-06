// Simple Abstract Factory example
abstract class Button {
  String render();
}

class WindowsButton implements Button {
  @override
  String render() => 'Windows Button';
}

class MacButton implements Button {
  @override
  String render() => 'Mac Button';
}

abstract class GUIFactory {
  Button createButton();
}

class WindowsFactory implements GUIFactory {
  @override
  Button createButton() => WindowsButton();
}

class MacFactory implements GUIFactory {
  @override
  Button createButton() => MacButton();
}
