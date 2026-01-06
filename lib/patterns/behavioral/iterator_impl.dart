// Iterator example
class MyList<T> {
  final List<T> items;
  MyList(this.items);
  Iterator<T> iterator() => items.iterator;
}
