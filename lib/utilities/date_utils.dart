import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateUtilities {
  // Function to calculate days between two dates
  static String calculateDays(BuildContext context, DateTime? startDate,
      {DateTime? endDate, bool? onlyNum}) {
    final now = DateTime.now();

    if (startDate != null) {
      final targetDate = endDate ?? now;
      final difference = targetDate.difference(startDate).inDays;

      if (onlyNum != null) {
        return difference.toString();
      } else {
        final lastDigit = difference % 10;

        if (lastDigit == 1) {
          return '$difference ${AppLocalizations.of(context)!.day}';
        } else if (lastDigit >= 2 && lastDigit <= 4) {
          return '$difference ${AppLocalizations.of(context)!.days}'; // days
        } else {
          return '$difference ${AppLocalizations.of(context)!.dayss}'; // dayss
        }
      }
    }
    return '-';
  }

  // Function to calculate age based on birth date and current date
  static String calculateAge(BuildContext context, DateTime? birthDate) {
    final now = DateTime.now();

    if (now.isBefore(birthDate!)) {
      // Invalid birth date
      return AppLocalizations.of(context)!.incorrect_date; // incorrect_date
    }

    int years = now.year - birthDate.year;
    int months = now.month - birthDate.month;
    int days = now.day - birthDate.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += 12;
      if (days < 0) {
        // Calculate days for previous month
        final prevMonth = now.subtract(Duration(days: now.day));
        final daysInPrevMonth = prevMonth.difference(birthDate).inDays;
        days = daysInPrevMonth + days;
      }
    }

    if (months >= 10 && months <= 11) {
      return '${AppLocalizations.of(context)!.up_to} ${years + 1} ${AppLocalizations.of(context)!.yearss}'; // up_to yearss
    }

    if (years > 0) {
      if (years == 1) {
        return '$years ${AppLocalizations.of(context)!.year}'; // year
      } else if (years >= 2 && years <= 4) {
        return '$years ${AppLocalizations.of(context)!.years}'; // years
      } else {
        return '$years ${AppLocalizations.of(context)!.yearss}'; // yearss
      }
    } else if (months > 0) {
      if (months == 1) {
        return '$months ${AppLocalizations.of(context)!.month}'; // month
      } else if (months >= 2 && months <= 4) {
        return '$months ${AppLocalizations.of(context)!.months}'; // months
      } else {
        return '$months ${AppLocalizations.of(context)!.monthss}'; // monthss
      }
    } else {
      if (days == 1) {
        return '$days ${AppLocalizations.of(context)!.day}'; // day
      } else if (days >= 2 && days <= 4) {
        return '$days ${AppLocalizations.of(context)!.days}'; // days
      } else {
        return '$days ${AppLocalizations.of(context)!.dayss}';
      }
    }
  }
}
