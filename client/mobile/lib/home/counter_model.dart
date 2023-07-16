import 'package:penuba/home/counter.dart';
import 'package:isar/isar.dart';

part 'counter_model.g.dart';

@collection
@Name('Counter')
class CounterModel extends Counter {
  final Id id;

  const CounterModel({required this.id, super.value});

  CounterModel.fromEntity(
    Counter counter, {
    this.id = Isar.autoIncrement,
  }) : super(value: counter.value);
}
