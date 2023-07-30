import 'package:injectable/injectable.dart';
import 'package:penuba/trip/trip.dart';
import 'package:penuba/trip/trip_repo.dart';

@lazySingleton
class TripUsecase {
  final TripRepo tripRepo;

  TripUsecase(this.tripRepo);

  Future<List<Trip>> getAll() {
    return tripRepo.getAll();
  }

  Future<void> create(Trip trip) {
    return tripRepo.create(trip);
  }
}
