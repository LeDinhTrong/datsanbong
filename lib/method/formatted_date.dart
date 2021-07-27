import 'package:intl/intl.dart';

convertDate(String strDate) {
  DateTime date = DateFormat("yyyy-MM-dd hh:mm:ss").parse(strDate);
  strDate = DateFormat.Hm().format(date);
  return strDate;
}

convertBookingDay(String strDay) {
  DateTime date = DateFormat("yyyy-MM-dd").parse(strDay);
  return date;
}
