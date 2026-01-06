// Simple Builder example
class ProductToBuild {
  String partA = '';
  String partB = '';
  @override
  String toString() => 'Product(partA: $partA, partB: $partB)';
}

abstract class Builder {
  void buildPartA();
  void buildPartB();
  ProductToBuild getResult();
}

class ConcreteBuilder implements Builder {
  final ProductToBuild _product = ProductToBuild();
  @override
  void buildPartA() {
    _product.partA = 'A';
  }

  @override
  void buildPartB() {
    _product.partB = 'B';
  }

  @override
  ProductToBuild getResult() => _product;
}

class Director {
  final Builder builder;
  Director(this.builder);
  ProductToBuild construct() {
    builder.buildPartA();
    builder.buildPartB();
    return builder.getResult();
  }
}
