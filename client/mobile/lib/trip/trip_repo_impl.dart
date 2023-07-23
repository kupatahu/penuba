import 'package:injectable/injectable.dart';
import 'package:penuba/trip/trip.dart';
import 'package:penuba/trip/trip_collection.dart';
import 'package:penuba/trip/trip_model.dart';
import 'package:penuba/trip/trip_repo.dart';

@LazySingleton(as: TripRepo)
class TripRepoImpl implements TripRepo {
  final TripCollection tripCollection;

  TripRepoImpl(this.tripCollection);

  @override
  Future<List<TripModel>> getAll() {
    // return tripCollection.getAll();
    final trip = Trip.create(destination: 'Machu Picchu', start: DateTime.parse('2023-10-10T14:00:00+0700'), end: DateTime.parse('2023-10-17T14:00:00+0700'),);
    return Future.value([TripModel.fromEntity(trip)]);
  }

  @override
  Future<void> create(Trip trip) {
    final model = TripModel.fromEntity(trip);
    return tripCollection.put(model);
  }
}
