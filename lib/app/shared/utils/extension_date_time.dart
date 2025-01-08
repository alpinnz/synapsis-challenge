import 'package:intl/intl.dart';

extension ExtensionDateTime on DateTime {
  /// Format DateTime to String
  String format(String format) {
    return DateFormat(format).format(this);
  }

  /// Format DateTime to String using local format
  String formatLocal(String format) {
    return DateFormat(format, 'id_ID').format(toLocal());
  }
}
