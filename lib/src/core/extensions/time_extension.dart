import 'package:intl/intl.dart';

extension type TimeX(String string) {
  String get getFormattedDate {
    try {
      final dateTime = DateTime.parse(string);
      final date = DateFormat('d MMM yyyy').format(dateTime);
      return date;
    } catch (e) {
      return 'Invalid date';
    }
  }

  String get getFormattedDateOnly {
    try {
      final dateTime = DateTime.parse(string);
      final date = DateFormat('d MMM yyyy').format(dateTime);
      return date;
    } catch (e) {
      return 'Invalid date';
    }
  }

  String get getFormattedMonthDate {
    try {
      final dateTime = DateTime.parse(string);
      final date = DateFormat('d MMM yyyy').format(dateTime);
      final time = DateFormat('h:mm a').format(dateTime);

      // Convert "AM" and "PM" to "A.M." and "P.M."
      final formattedTime = time.replaceAll('AM', 'A.M.').replaceAll(
            'PM',
            'P.M.',
          );

      return '$date . $formattedTime';
    } catch (e) {
      return 'Invalid date';
    }
  }

  String get getFormattedMonthTimeDate {
    try {
      final dateTime = DateTime.parse(string);
      final date = DateFormat('d MMM').format(dateTime);
      final time = DateFormat('h:mm a').format(dateTime);

      return '$date . $time';
    } catch (e) {
      return 'Invalid date';
    }
  }

  String get toFormattedDatProperties {
    try {
      final dateTime = DateTime.parse(string);

      // List of month names
      const months = <String>[
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];

      // Format the date
      final day = dateTime.day.toString();
      final month = months[dateTime.month - 1];
      final year = dateTime.year.toString();

      return '$day $month $year';
    } catch (e) {
      return 'Invalid date';
    }
  }

  String get getFormattedMonth {
    try {
      final dateTime = DateTime.parse(string);
      final date = DateFormat('d MMM').format(dateTime);
      return date;
    } catch (e) {
      return 'Invalid date';
    }
  }

  String get getFormattedMonthWithYear {
    try {
      final dateTime = DateTime.parse(string);
      final date = DateFormat('d MMM yyy').format(dateTime);
      return date;
    } catch (e) {
      return 'Invalid date';
    }
  }

  String get getFullFormattedDate {
    try {
      final dateTime = DateTime.parse(string);
      final time = DateFormat('hh:mm a').format(dateTime);
      final date = DateFormat('dd MMMM yyyy').format(dateTime);

      return '$time $date';
    } catch (e) {
      return 'Invalid date';
    }
  }

  String get getGreeting {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
