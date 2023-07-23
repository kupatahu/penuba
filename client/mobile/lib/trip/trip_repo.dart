
import 'package:penuba/trip/trip.dart';

abstract class TripRepo {
  Future<List<Trip>> getAll();

  Future<void> create(Trip trip);
}
