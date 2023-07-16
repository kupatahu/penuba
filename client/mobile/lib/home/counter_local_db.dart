import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:penuba/local_db/local_db.dart';
import 'package:penuba/home/counter_model.dart';

@lazySingleton
class CounterLocalDb {
  final LocalDb localDb;

  CounterLocalDb(this.localDb);

  IsarCollection<CounterModel> get collection => localDb.collection<CounterModel>();

  Future<CounterModel?> get() async {
    return collection.get(1);
  }

  Future<void> set(CounterModel counter) async {
    await localDb.run(() async {
      await collection.put(counter);
    });
  }
}
