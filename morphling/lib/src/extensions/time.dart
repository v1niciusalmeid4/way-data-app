import 'package:flutter/material.dart';

abstract class TimeOfDayFactory {
  static TimeOfDay fromString(String time) {
    final List<String> parts = time.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }
}

extension TimeExt on TimeOfDay {
  String formatStandalone() {
    final String hourString = hour.toString().padLeft(2, '0');
    final String minuteString = minute.toString().padLeft(2, '0');
    return '$hourString:$minuteString';
  }
}
