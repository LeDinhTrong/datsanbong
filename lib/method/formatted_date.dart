import 'package:intl/intl.dart';

convertDate(String strDate) {
  DateTime date = DateFormat("yyyy-MM-dd hh:mm:ss").parse(strDate);
  strDate = DateFormat.Hm().format(date);
  return strDate;
}

convertBookingDay(String strDay) {
  DateTime date = DateFormat("yyyy-MM-dd hh:mm:ss").parse(strDay);
  strDay = DateFormat.yMMMEd().format(date);
  return strDay;
}

convertTime(String strDay) {
  DateTime date = DateFormat("yyyy-MM-dd hh:mm:ss").parse(strDay);
  return date;
}

String calTotalTime(DateTime startTime, DateTime endTime) {
  int totalTime = ((endTime.hour * 60) + endTime.minute) -
      ((startTime.hour * 60) + startTime.minute);

  int minuts = totalTime.floor();
  return '$minuts';
}

calTotalPrice(DateTime from, DateTime to) {
  int duration = int.parse(calTotalTime(from, to));
  int total = duration * 3000;
  return total;
}
