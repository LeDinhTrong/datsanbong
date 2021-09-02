import 'package:field_for_rent/blocs/b700_footbalfield_bloc.dart';
import 'package:field_for_rent/method/formatted_date.dart';
import 'package:field_for_rent/method/utils.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/booking.dart';
import 'package:field_for_rent/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventEditingPage extends StatefulWidget {
  final int fieldId;
  final Event? event;
  EventEditingPage({this.event, required this.fieldId});

  @override
  _EventEditingPageState createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  SharedPreferences? _prefs;
  final _fieldBloc = FootbalFieldBloc();
  final titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? fromDate;
  DateTime? toDate;

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate!,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;
    setState(() => toDate = date);
  }

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate!, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate!)) {
      toDate = DateTime(
          date.year, date.month, date.day, toDate!.hour, toDate!.minute);
    }
    setState(() => fromDate = date);
    print(fromDate);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
      );
      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    _fieldBloc.dispose();
  }

  _init() async {
    _fieldBloc.callWhat704(widget.fieldId);
  }

  _pickStartDateTime() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ListTile(
            title: Text(Utils.toDate(fromDate!)),
            trailing: Icon(Icons.arrow_drop_down),
            onTap: () => pickFromDateTime(pickDate: true),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(Utils.toTime(fromDate!)),
            trailing: Icon(Icons.arrow_drop_down),
            onTap: () => pickFromDateTime(pickDate: false),
          ),
        ),
      ],
    );
  }

  _pickEndDateTime() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ListTile(
            title: Text(Utils.toDate(toDate!)),
            trailing: Icon(Icons.arrow_drop_down),
            onTap: () => pickToDateTime(pickDate: true),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(Utils.toTime(toDate!)),
            trailing: Icon(Icons.arrow_drop_down),
            onTap: () => pickToDateTime(pickDate: false),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        leading: CloseButton(),
        actions: [
          StreamBuilder(
            stream: _fieldBloc.footbalFieldStream704,
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              return ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () async {
                  _prefs = await SharedPreferences.getInstance();
                  final Repository _repo = Repository();
                  _repo.r800BookingProvider.p800Booking(801, {
                    "Message": titleController.text,
                    "Start": "$fromDate",
                    "End": "$toDate",
                    "Status": "0",
                    "User_Id": _prefs!.getString('id'),
                    "Field_Id": widget.fieldId,
                    "Total": "${calTotalPrice(
                      fromDate!,
                      toDate!,
                      int.parse(snapshot.data.first.Price_Per_Hour),
                    )}",
                  });
                  Navigator.pop(context, true);
                },
                icon: Icon(Icons.done),
                label: Text("SAVE"),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Add Title",
                ),
                onFieldSubmitted: (_) {},
                controller: titleController,
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "From",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _pickStartDateTime(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "To",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _pickEndDateTime(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
