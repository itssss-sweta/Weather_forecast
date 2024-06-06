import 'package:intl/intl.dart';

extension TimeFormatExtension on String {
  /// Formats the time in 00 AM format.
  String get formatTime {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('hh a').format(dateTime);
  }
}
