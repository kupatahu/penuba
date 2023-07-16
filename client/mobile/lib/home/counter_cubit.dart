import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:penuba/home/counter.dart';
import 'package:penuba/home/counter_usecase.dart';

@singleton
class CounterCubit extends Cubit<Counter> {
  final CounterUsecase counterUsecase;

  CounterCubit(this.counterUsecase) : super(const Counter());

  Future<void> init() async {
    final counter = await counterUsecase.get();

    if (counter != null) {
      emit(counter);
    }
  }

  void increment() {
    final updatedCounter = counterUsecase.increment(state);
    emit(updatedCounter);
  }
}
