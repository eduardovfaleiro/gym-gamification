import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
