import 'package:injectable/injectable.dart';
import 'package:penuba/data/collection.dart';
import 'package:penuba/data/local_db.dart';
import 'package:penuba/trip/trip_model.dart';

@lazySingleton
class TripCollection extends BaseCollection<TripModel> {
  TripCollection(LocalDb localDb) : super(localDb);
}
