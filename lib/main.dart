import 'package:field_for_rent/pages/components/bottom_navigation_bar.dart';
import 'package:field_for_rent/pages/views/booking.dart';
import 'package:field_for_rent/pages/views/field_detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SafeArea(child: TableEventsExample()),
    );
  }
}
