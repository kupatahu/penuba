import 'package:injectable/injectable.dart';
import 'package:penuba/data/collection.dart';
import 'package:penuba/data/local_db.dart';
import 'package:penuba/home/counter_model.dart';

@lazySingleton
class CounterCollection extends BaseCollection<CounterModel> {
  CounterCollection(LocalDb localDb) : super(localDb);
}
