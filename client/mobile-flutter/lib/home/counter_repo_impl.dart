import 'package:injectable/injectable.dart';
import 'package:penuba/home/counter.dart';
import 'package:penuba/home/counter_collection.dart';
import 'package:penuba/home/counter_model.dart';
import 'package:penuba/home/counter_repo.dart';

@LazySingleton(as: CounterRepo)
class CounterRepoImpl implements CounterRepo {
  final CounterCollection counterCollection;

  CounterRepoImpl(this.counterCollection);

  @override
  Future<CounterModel?> get() {
    return counterCollection.get(1);
  }

  @override
  Future<void> set(Counter counter) {
    final model = CounterModel.fromEntity(counter, id: 1);
    return counterCollection.put(model);
  }
}
