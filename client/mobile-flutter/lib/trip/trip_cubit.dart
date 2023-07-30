import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:penuba/trip/trip.dart';
import 'package:penuba/trip/trip_usecase.dart';

@singleton
class TripCubit extends Cubit<List<Trip>> {
  final TripUsecase tripUsecase;

  TripCubit(this.tripUsecase) : super([]);

  Future<void> fetchAll() async {
    final trips = await tripUsecase.getAll();
    emit(trips);
  }
}
