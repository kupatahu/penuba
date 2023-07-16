import 'package:injectable/injectable.dart';
import 'package:penuba/home/counter.dart';
import 'package:penuba/home/counter_repo.dart';

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
}
