import 'package:injectable/injectable.dart';
import 'package:penuba/feature/home/counter.dart';
import 'package:penuba/feature/home/counter_repo.dart';

@lazySingleton
class CounterUsecase {
  final CounterRepo counterRepo;

  CounterUsecase(this.counterRepo);

  Future<Counter?> get() {
    return counterRepo.get();
  }

  Counter increment(Counter counter) {
    final updatedCounter = counter.increment();
    counterRepo.set(updatedCounter);

    return updatedCounter;
  }

  Counter reset() {
    const counter = Counter();
    counterRepo.set(counter);

    return counter;
  }
}
