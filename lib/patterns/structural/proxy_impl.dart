// Proxy example
class RealSubject {
  String request() => 'real_result';
}

class ProxySubject {
  final RealSubject _real;
  ProxySubject(this._real);
  String request() {
    // can add access control, caching, logging
    return _real.request();
  }
}
