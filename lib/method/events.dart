// import 'dart:collection';

// import 'package:field_for_rent/models/m700_footbalfield_model.dart';
// import 'package:field_for_rent/models/m800_booking_model.dart';
// import 'package:field_for_rent/pages/views/booking.dart';
// import 'package:field_for_rent/pages/views/field_detail.dart';
// import 'package:field_for_rent/repositories/repositories.dart';
// import 'package:table_calendar/table_calendar.dart';

// class Event {
//   final String title;

//   const Event({required this.title});

//   @override
//   String toString() => title;
// }

// final kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);
// Api api = Api();
// List data = api.getBooking();
// final _kEventSource = Map.fromIterable(data,
//     key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
//     value: (item) => List.generate(
//         item % 4 + 1, (index) => Event(title: 'Event $item | ${index + 1}')))
//   ..addAll({
//     kToday: [
//       Event(title: 'Today\'s Event 1'),
//       Event(title: 'Today\'s Event 2'),
//     ],
//   });
// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }

// // final eventApi = getBooking();

// /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last.difference(first).inDays + 1;
//   return List.generate(
//     dayCount,
//     (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }

// final kToday = DateTime.now();
// final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
