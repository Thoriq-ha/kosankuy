import 'package:intl/intl.dart';

class NumberFormatter {
  static String toRupiah(dynamic num) {
    return 'Rp ${NumberFormat('#,##0', 'ID').format(num)}';
  }
}
