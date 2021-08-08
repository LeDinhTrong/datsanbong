import 'package:field_for_rent/models/m800_booking_model.dart';
import 'package:field_for_rent/pages/views/booking.dart';
import 'package:field_for_rent/repositories/repositories.dart';
import 'package:flutter/cupertino.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }
}

// notifyListeners();
