import 'package:intl/intl.dart';

class Utils {
  static String formatDate(String date) =>
      DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
}
