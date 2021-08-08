import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:field_for_rent/method/formatted_date.dart';
import 'package:field_for_rent/models/m800_booking_model.dart';
import 'package:field_for_rent/pages/components/bottom_navigation_bar.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/event_editing.dart';
import 'package:field_for_rent/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingPage extends StatefulWidget {
  final String fieldId;
  BookingPage({required this.fieldId});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _repo = Repository();

  Future<List<Event>> getBooking() async {
    List<Event> bookingData = [];
    await _repo.r800BookingProvider.p800Booking(800, {}).then((value) async {
      for (var i = 0; i < value.length; i++) {
        M800BookingModel bookingModel = value[i];
        bookingData.add(Event(
          eventName: bookingModel.Message.toString(),
          from: convertTime(bookingModel.Start.toString()),
          to: convertTime(bookingModel.End.toString()),
        ));
      }
    });
    return bookingData;
  }

  @override
  void initState() {
    super.initState();
    getBooking();
  }

  @override
  Widget build(BuildContext context) {
    Widget _calendarWidget(Size size, data) {
      return Expanded(
        flex: 12,
        child: SfCalendar(
          view: CalendarView.month,
          initialSelectedDate: DateTime.now(),
          dataSource: EventDataSource(data),
          monthViewSettings: MonthViewSettings(
              showAgenda: true, agendaViewHeight: size.height * 0.3),
        ),
      );
    }

    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: getBooking(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.length);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryLightColor,
                title: Text("Booking"),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    //Calendar widget
                    _calendarWidget(size, snapshot.data),

                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FloatingActionButton(
                              backgroundColor: kPrimaryColor,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EventEditingPage(
                                              fieldId: widget.fieldId,
                                            ))).then((value) {
                                  setState(() {});
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                              ),
                              child: Row(
                                children: [
                                  // Text(
                                  //   "Price: ",
                                  //   style: TextStyle(color: kPrimaryColor, fontSize: 20),
                                  // ),
                                  // Text(
                                  //   fieldModel.Price_Per_Hour.toString() + " vnd/h",
                                  //   style: TextStyle(
                                  //       color: Colors.white, fontSize: 20),
                                  // ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: 150,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                kPrimaryColor),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                kPrimaryColor),
                                      ),
                                      onPressed: () async {
                                        if (await confirm(
                                          context,
                                          title: Text('Confirm'),
                                          content: Text(
                                              'Are you sure you want to booking?'),
                                          textOK: Text('Yes'),
                                          textCancel: Text('No'),
                                        )) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BottomNaviBar()));
                                        }
                                      },
                                      child: Text(
                                        "Booking",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Event {
  Event(
      {required this.eventName,
      required this.from,
      required this.to,
      this.background = kPrimaryColor,
      this.isAllDay = false});

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
