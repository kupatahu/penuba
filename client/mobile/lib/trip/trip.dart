import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Trip implements Equatable {
  final String destination;
  final DateTime start;
  final DateTime end;

  Trip({required this.destination, required this.start, required this.end});

  @override
  List<Object?> get props => [destination, start, end];

  @override
  bool? get stringify => null;

  String _formattedDate(DateTime date) =>
      DateFormat().add_d().add_MMM().format(date);

  String get formattedDuration =>
      '${_formattedDate(start)} - ${_formattedDate(end)} (${end.difference(start).inDays} days)';

  String get startsIn => 'Starts in ${end.difference(DateTime.now()).inDays} days';
}
