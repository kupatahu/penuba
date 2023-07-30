import 'package:isar/isar.dart';
import 'package:penuba/trip/trip.dart';

part 'trip_model.g.dart';

@Collection(ignore: {'props'})
class TripModel extends Trip {
  final Id id;
  @override
  @Index(unique: true)
  final String identifier;

  TripModel({
    required this.id,
    required this.identifier,
    required super.destination,
    required super.start,
    required super.end,
  }) : super(identifier: identifier);

  factory TripModel.fromEntity(Trip trip) {
    return TripModel(
      id: Isar.autoIncrement,
      identifier: trip.identifier,
      destination: trip.destination,
      start: trip.start,
      end: trip.end,
    );
  }
}
