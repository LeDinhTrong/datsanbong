// import 'package:field_for_rent/models/m500_user_model.dart';
// import 'package:field_for_rent/models/m700_footbalfield_model.dart';
// import 'package:field_for_rent/models/m900_imagefield_model.dart';
// import 'package:field_for_rent/repositories/repositories.dart';

// Future<List<M700FootbalFieldModel>> getData() async {
//   final _repo = Repository();
//   List<M700FootbalFieldModel> FieldData = [];

//   await _repo.r700FootbalFieldProvider
//       .p700FootbalField(700, {}).then((value) async {
//     FieldData = value;
//   });
//   return FieldData;
// }

// Future<List<M500UserModel>> getUser() async {
//   final _repo = Repository();
//   List<M500UserModel> UserData = [];
//   await _repo.r500UserProvider.p500User(500, {}).then((value) async {
//     UserData = value;
//   });
//   return UserData;
// }

// Future<List<M900ImageFieldModel>> getImg(String j) async {
//   final _repo = Repository();
//   List<M900ImageFieldModel> ImgData = [];
//   await _repo.r900ImageFieldProvider
//       .p900ImageField(907, {'Field_Id': j}).then((value) async {
//     ImgData = value;
//   });
//   return ImgData;
// }

// import 'package:field_for_rent/method/events.dart';
// import 'package:field_for_rent/models/m800_booking_model.dart';
// import 'package:field_for_rent/pages/constants.dart';
// import 'package:field_for_rent/pages/views/field_detail.dart';
// import 'package:field_for_rent/pages/views/finish_booking.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class BookingPage extends StatefulWidget {
//   final String index;
//   BookingPage({Key? key, required this.index}) : super(key: key);

//   @override
//   _BookingPageState createState() => _BookingPageState();
// }

// class _BookingPageState extends State<BookingPage> {
//   Map<DateTime, List<Event>>? selectedEvents;
//   CalendarFormat format = CalendarFormat.month;
//   DateTime selectedDay = DateTime.now();
//   DateTime focusedDay = DateTime.now();
//   AnimationController? _animationController;

//   TextEditingController _eventController = TextEditingController();

//   @override
//   void initState() {
//     selectedEvents = {};
//     super.initState();
//   }

//   List<Event> _getEventsfromDay(DateTime date) {
//     return selectedEvents?[date] ?? [];
//   }

//   @override
//   void dispose() {
//     _eventController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(widget.index);
//     return FutureBuilder(
//       future: getImg(widget.index),
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.hasData) {
//           List<M800BookingModel> bookingData = snapshot.data["booking"];
//           M800BookingModel? bookingModel;
//           for (var i = 0; i < bookingData.length; i++) {
//             bookingModel = bookingData[i];
//           }
//           return Scaffold(
//             backgroundColor: Color(0xfff6f6f9),
//             appBar: AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               iconTheme: IconThemeData(),
//               centerTitle: true,
//               title: Text(
//                 "Booking",
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//             body: Column(
//               children: [
//                 Expanded(
//                   flex: 9,
//                   child: Column(
//                     children: [
//                       TableCalendar(
//                         focusedDay: selectedDay,
//                         firstDay: DateTime(DateTime.now().year - 5),
//                         lastDay: DateTime(DateTime.now().year + 5),
//                         calendarFormat: format,
//                         onFormatChanged: (CalendarFormat _format) {
//                           setState(() {
//                             format = _format;
//                           });
//                         },
//                         onDaySelected: (DateTime selectDay, DateTime focusDay) {
//                           setState(() {
//                             selectedDay = selectDay;
//                             focusedDay = focusDay;
//                           });
//                         },
//                         selectedDayPredicate: (DateTime date) {
//                           return isSameDay(selectedDay, date);
//                         },
//                         eventLoader: _getEventsfromDay,
//                       ),
//                       ..._getEventsfromDay(selectedDay).map(
//                         (Event event) => ListTile(
//                           title: Text(
//                             event.title,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 FloatingActionButton.extended(
//                   onPressed: () => showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: Text("Add Event"),
//                       content: TextFormField(
//                         controller: _eventController,
//                       ),
//                       actions: [
//                         TextButton(
//                           child: Text("Cancel"),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                         TextButton(
//                           child: Text("Ok"),
//                           onPressed: () {
//                             if (_eventController.text.isEmpty) {
//                             } else {
//                               if (selectedEvents?[selectedDay] != null) {
//                                 selectedEvents?[selectedDay]?.add(
//                                   Event(title: _eventController.text),
//                                 );
//                               } else {
//                                 selectedEvents?[selectedDay] = [
//                                   Event(title: _eventController.text)
//                                 ];
//                               }
//                             }
//                             Navigator.pop(context);
//                             _eventController.clear();
//                             setState(() {});
//                             return;
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   label: Text("Add Event"),
//                   icon: Icon(Icons.add),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     height: double.infinity,
//                     width: double.infinity,
//                     child: Stack(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           height: double.infinity,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: kPrimaryLightColor,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Container(
//                               height: double.infinity,
//                               width: 150,
//                               child: ElevatedButton(
//                                   style: ButtonStyle(
//                                     foregroundColor:
//                                         MaterialStateProperty.all<Color>(
//                                             kPrimaryColor),
//                                     backgroundColor:
//                                         MaterialStateProperty.all<Color>(
//                                             kPrimaryColor),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 FinishBooking()));
//                                   },
//                                   child: Text(
//                                     "Booking",
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20),
//                                   )),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
