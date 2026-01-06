// Flyweight example
class Flyweight {
  final String intrinsic;
  Flyweight(this.intrinsic);
  String op(String extrinsic) => 'intrinsic=$intrinsic, extrinsic=$extrinsic';
}

class FlyweightFactory {
  final Map<String, Flyweight> _pool = {};
  Flyweight get(String key) => _pool.putIfAbsent(key, () => Flyweight(key));
}
