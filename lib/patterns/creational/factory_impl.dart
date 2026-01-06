// Simple Factory example
abstract class Product {
  String name();
}

class ProductA implements Product {
  @override
  String name() => 'Product A';
}

class ProductB implements Product {
  @override
  String name() => 'Product B';
}

class SimpleFactory {
  static Product create(String type) {
    if (type == 'A') return ProductA();
    return ProductB();
  }
}
