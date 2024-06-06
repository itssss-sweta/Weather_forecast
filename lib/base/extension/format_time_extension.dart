import 'package:intl/intl.dart';

extension TimeFormatExtension on String {
  String get formatTime {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('h:mma').format(dateTime);
  }
}
