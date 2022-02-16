import 'package:intl/intl.dart';

class Utils {
  String toDate(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);

    return '$date';
  }
}
