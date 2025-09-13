import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get namedWeekday => _formatter('EEE').format(this);
  String get namedMonth => _formatter('MMM').format(this);

  String get formatToHours {
    final DateFormat formatter = _formatter(
      'HH:mm',
    );

    return formatter.format(this);
  }

  String get formatToDisplay {
    final DateFormat formatter = _formatter(
      'dd/MM/yyyy \'às\' HH:mm:ss',
    );

    return formatter.format(this);
  }

  String get formatToDisplayWeekDay {
    final DateFormat formatter = _formatter(
      'EEEE, dd \'de\' MMMM',
    );

    return formatter.format(this);
  }

  String get formatToDisplayDayWeekDayCompact {
    final DateFormat formatter = _formatter(
      'd EEE',
    );

    return formatter.format(this);
  }

  String get formatToDisplayDayWeekDayOnlyLettersCompact {
    final DateFormat formatter = _formatter(
      'EEE',
    );

    return formatter.format(this);
  }

  String get formatToDisplayWeekDayDayMonthCompact {
    final DateFormat formatter = _formatter(
      'EEE d MMM',
    );

    return formatter.format(this);
  }

  String get formatToDisplayCompact {
    final DateFormat formatter = _formatter(
      'dd/MM/yyyy',
    );

    return formatter.format(this);
  }

  String get formatToApi {
    final DateFormat formatter = _formatter(
      'yyyy-MM-dd',
    );

    return formatter.format(this);
  }

  String get formatToDayOrToday {
    final now = DateTime.now();
    final todayMidnight = DateTime(now.year, now.month, now.day);
    final difference = todayMidnight.difference(DateTime(year, month, day));

    if (difference.inDays == 0) {
      return 'hoje, às $formatToHours';
    } else if (difference.inDays == 1) {
      return 'ontem, às $formatToHours';
    } else {
      return 'dia $formatToDisplayCompact';
    }
  }

  String get welcomeMessage {
    final int hour = this.hour;

    if (hour < 12) {
      return 'Bom dia';
    } else if (hour < 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }

  DateFormat _formatter(String pattern) => DateFormat(
        pattern,
        'pt_BR',
      );
}
