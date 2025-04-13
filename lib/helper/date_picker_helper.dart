import 'package:flutter/material.dart';

class DatePickerHelper {
  static Future<DateTime?> selectDate(BuildContext context,
      {bool isOld = false,
      bool isFutureDate = true,
      DateTime? startDate}) async {
    final DateTime now = DateTime.now();
    final DateTime initialDate = startDate != null
        ? startDate.isBefore(now)
            ? now
            : startDate
        : now;
    final DateTime start =
        startDate ?? (isOld ? DateTime(now.year - 100) : now);

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: start,
        lastDate: isFutureDate ? DateTime(2101) : DateTime.now());
    if (picked != null) {
      return picked;
    }
    return null;
  }
}
