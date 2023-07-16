import 'package:penuba/feature/home/counter.dart';

abstract class CounterRepo {
  Future<Counter?> get();

  Future<void> set(Counter counter);
}
