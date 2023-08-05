import 'package:isar/isar.dart';
import 'package:penuba/data/local_db.dart';

abstract class BaseCollection<T> {
  final LocalDb localDb;

  BaseCollection(this.localDb);

  IsarCollection<T> get _collection => localDb.collection<T>();

  Future<T?> get(Id id) async {
    return _collection.get(id);
  }

  Future<List<T>> getAll() async {
    return _collection.where().findAll();
  }

  Future<void> put(T model) async {
    await localDb.run(() async {
      await _collection.put(model);
    });
  }
}
