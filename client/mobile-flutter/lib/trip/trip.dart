import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:penuba/util/uuid.dart';

class Trip implements Equatable {
  final String identifier;
  final String destination;
  final DateTime start;
  final DateTime end;

  const Trip({
    required this.identifier,
    required this.destination,
    required this.start,
    required this.end,
  });

  Trip.create({
    required this.destination,
    required this.start,
    required this.end,
  }) : identifier = uuid();

  @override
  List<Object?> get props => [identifier, destination, start, end];

  @override
  bool? get stringify => null;

  String _formattedDate(DateTime date) =>
      DateFormat().add_d().add_MMM().format(date);

  String get formattedDuration =>
      '${_formattedDate(start)} - ${_formattedDate(end)} (${end.difference(start).inDays} days)';

  String get startsIn =>
      'Starts in ${end.difference(DateTime.now()).inDays} days';
}
