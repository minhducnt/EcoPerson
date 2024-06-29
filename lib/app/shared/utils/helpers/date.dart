import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import 'package:angelhack_hcm/app/shared/utils/helpers/misc.dart';
import 'package:angelhack_hcm/app/shared/utils/ui_utils.dart';

String? convertDateTimeToString(DateTime date) {
  final month = date.month;
  final year = date.year;
  return '$month/$year';
}

String? getFirstDayOfMonth(
  DateTime? date, {
  String pattern = 'yyyy-MM-dd',
}) {
  if (isNullOrEmpty(date)) return null;
  return Jiffy.parseFromDateTime(date!)
      .startOf(Unit.month)
      .format(pattern: pattern);
}

String? getLastDayOfMonth(
  DateTime? date, {
  String pattern = 'yyyy-MM-dd',
}) {
  if (isNullOrEmpty(date)) return null;
  return Jiffy.parseFromDateTime(date!)
      .endOf(Unit.month)
      .format(pattern: pattern);
}

String? getFirstDayOfLastMonth(
  DateTime? date, {
  String pattern = 'yyyy-MM-dd',
}) {
  if (isNullOrEmpty(date)) return null;
  return Jiffy.parseFromDateTime(date!)
      .subtract(months: 1)
      .startOf(Unit.month)
      .format(pattern: pattern);
}

String? getLastDayOfLastMonth(
  DateTime? date, {
  String pattern = 'yyyy-MM-dd',
}) {
  if (isNullOrEmpty(date)) return null;
  return Jiffy.parseFromDateTime(date!)
      .subtract(months: 1)
      .endOf(Unit.month)
      .format(pattern: pattern);
}

String? getFirstDayOfYear(
  DateTime? date, {
  String pattern = 'yyyy-MM-dd',
}) {
  if (isNullOrEmpty(date)) return null;
  return Jiffy.parseFromDateTime(date!)
      .startOf(Unit.year)
      .format(pattern: pattern);
}

String? getLastDayOfYear(
  DateTime? date, {
  String pattern = 'yyyy-MM-dd',
}) {
  if (isNullOrEmpty(date)) return null;
  return Jiffy.parseFromDateTime(date!)
      .endOf(Unit.year)
      .format(pattern: pattern);
}

String getDifferentTime(int timeDiff) {
  final seconds = timeDiff ~/ 1000;
  final minutes = seconds ~/ 60;
  final hours = minutes ~/ 60;
  final days = hours ~/ 24;
  final weeks = days ~/ 7;

  if (seconds < 60) {
    return '$seconds ${localeLang.secondsAgo}';
  } else if (minutes < 60) {
    return '$minutes ${localeLang.minutesAgo}';
  } else if (hours < 24) {
    return '$hours ${localeLang.hoursAgo}';
  } else if (days < 7) {
    return '$days ${localeLang.daysAgo}';
  } else {
    return '$weeks ${localeLang.weeksAgo}';
  }
}

String parseLocalTime(String? input) {
  if (input == null) return '';
  return DateFormat('HH:mm:ss').format(
    DateTime.parse(input).toLocal(),
  );
}

String getMonthName(String value) {
  return Jiffy.parse(value).MMM;
}
