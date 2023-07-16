import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:penuba/local_db/schemas.dart';

@lazySingleton
class LocalDb {
  final String directory;
  final Isar isar;

  LocalDb._(this.directory, this.isar);

  @factoryMethod
  static Future<LocalDb> create() async {
    final directory = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(schemas, directory: directory.path);

    return LocalDb._(directory.path, isar);
  }

  IsarCollection<T> collection<T>() {
    return isar.collection<T>();
  }

  Future<T> run<T>(Future<T> Function() callback) {
    return isar.writeTxn<T>(callback);
  }
}
