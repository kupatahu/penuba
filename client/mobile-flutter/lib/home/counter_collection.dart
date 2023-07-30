import 'package:injectable/injectable.dart';
import 'package:penuba/local_datasource/collection.dart';
import 'package:penuba/local_datasource/local_db.dart';
import 'package:penuba/home/counter_model.dart';

@lazySingleton
class CounterCollection extends BaseCollection<CounterModel> {
  CounterCollection(LocalDb localDb) : super(localDb);
}
