import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:field_for_rent/blocs/b800_booking_bloc.dart';
import 'package:field_for_rent/method/formatted_date.dart';
import 'package:field_for_rent/models/m800_booking_model.dart';
import 'package:field_for_rent/pages/components/routes.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/event_editing.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingPage extends StatefulWidget {
  final int fieldId;
  BookingPage({required this.fieldId});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _bookingBloc = BookingBloc();
  List<M800BookingModel>? _bookinglist;

  @override
  void initState() {
    super.initState();
    listent();
  }

  @override
  void dispose() {
    super.dispose();
    _bookingBloc.dispose();
  }

  listent() {
    _bookingBloc.bookingStream807.listen((event) {
      _bookinglist = event;
    });

    _init();
  }

  _init() async {
    _bookingBloc.callWhat807(widget.fieldId);
  }

  Widget _calendarWidget(Size size, List<Event> eventList) {
    return Expanded(
      flex: 12,
      child: SfCalendar(
        view: CalendarView.month,
        initialSelectedDate: DateTime.now(),
        dataSource: EventDataSource(eventList),
        monthViewSettings: MonthViewSettings(
            showAgenda: true, agendaViewHeight: size.height * 0.3),
      ),
    );
  }

  Widget _addEvent() {
    return Expanded(
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
                  setState(() {
                    _bookingBloc.callWhat807(widget.fieldId);
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomButton() {
    return Expanded(
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
                  // for (var item in _eventList!)
                  //   Text(
                  //     "${calTotalPrice(item.from, item.to)}" + " vnd/h",
                  //     style: TextStyle(color: Colors.white, fontSize: 20),
                  //   ),
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
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                      ),
                      onPressed: () async {
                        if (await confirm(
                          context,
                          title: Text('Confirm'),
                          content: Text('Are you sure you want to booking?'),
                          textOK: Text('Yes'),
                          textCancel: Text('No'),
                        )) {
                          Navigator.pushReplacementNamed(context, navibarRoute);
                        }
                      },
                      child: Text(
                        "Booking",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: _bookingBloc.bookingStream807,
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
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
                    _calendarWidget(
                        size,
                        _bookinglist!
                            .map((e) => Event(
                                eventName: e.Message!,
                                from: convertTime(e.Start!),
                                to: convertTime(e.End!)))
                            .toList()),
                    _addEvent(),
                    _bottomButton(),
                  ],
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error"));
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
