import 'package:penuba/home/counter.dart';

abstract class CounterRepo {
  Future<Counter?> get();

  Future<void> set(Counter counter);
}
