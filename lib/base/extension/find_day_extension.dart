import 'package:intl/intl.dart';

extension FindDayNameExtenion on String {
  /// Gets the name of the day from given date.
  String getDayName() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('EEEE').format(dateTime);
  }
}
