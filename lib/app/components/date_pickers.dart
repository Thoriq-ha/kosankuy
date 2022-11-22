import 'package:flutter/material.dart';

class DatePickers {
  static Future<void> showDateNative(
      BuildContext context, Function callback) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    callback(picked);
  }

  static Future<Null> showDateTimeNative(
      BuildContext context, Function callback) async {
    TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) selectedTime = picked;
    callback(picked);
  }
}
