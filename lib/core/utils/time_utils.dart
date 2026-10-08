import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

DateTime dayStart(DateTime d) => DateTime(d.year, d.month, d.day);

DateTime atTime(DateTime day, int hour, int minute) =>
    DateTime(day.year, day.month, day.day, hour, minute);

bool isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

/// intl ships no date symbols for Yorùbá, Igbo, Hausa or Pidgin, so date
/// formatting falls back to English for those locales.
String intlLocale(BuildContext context) {
  final code = Localizations.localeOf(context).languageCode;
  return DateFormat.localeExists(code) ? code : 'en';
}

String formatTime(BuildContext context, DateTime t) =>
    DateFormat.jm(intlLocale(context)).format(t);

String formatHm(BuildContext context, int hour, int minute) =>
    formatTime(context, DateTime(2000, 1, 1, hour, minute));

String formatDayLong(BuildContext context, DateTime d) =>
    DateFormat('EEEE, MMM d', intlLocale(context)).format(d);

String formatDate(BuildContext context, DateTime d) =>
    DateFormat.yMMMd(intlLocale(context)).format(d);

String formatMonthYear(BuildContext context, DateTime d) =>
    DateFormat.yMMM(intlLocale(context)).format(d);

String formatAmount(double v) =>
    v == v.roundToDouble() ? v.toInt().toString() : v.toStringAsFixed(1);
