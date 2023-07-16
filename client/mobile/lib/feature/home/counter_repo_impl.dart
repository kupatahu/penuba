import 'package:injectable/injectable.dart';
import 'package:penuba/feature/home/counter.dart';
import 'package:penuba/feature/home/counter_local_db.dart';
import 'package:penuba/feature/home/counter_model.dart';
import 'package:penuba/feature/home/counter_repo.dart';

@LazySingleton(as: CounterRepo)
class CounterRepoImpl implements CounterRepo {
  final CounterLocalDb counterLocalDb;

  CounterRepoImpl(this.counterLocalDb);

  @override
  Future<CounterModel?> get() {
    return counterLocalDb.get();
  }

  @override
  Future<void> set(Counter counter) {
    final model = CounterModel.fromEntity(counter, id: 1);
    return counterLocalDb.set(model);
  }
}
