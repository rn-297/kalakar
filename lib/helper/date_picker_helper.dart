import 'package:flutter/material.dart';

class DatePickerHelper{
  static Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null ) {
     return picked;
    }
    return null;
  }
}