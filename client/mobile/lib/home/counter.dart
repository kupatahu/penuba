class Counter {
  final int value;

  const Counter({this.value = 0});

  Counter increment() {
    return Counter(value: value + 1);
  }
}
