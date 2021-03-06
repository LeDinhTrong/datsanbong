import 'package:field_for_rent/blocs/b800_booking_bloc.dart';
import 'package:field_for_rent/method/formatted_date.dart';
import 'package:field_for_rent/models/history_model.dart';
import 'package:field_for_rent/pages/components/badge.dart';
import 'package:field_for_rent/pages/components/text_span.dart';
import 'package:field_for_rent/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  SharedPreferences? _prefs;
  final _bookingBloc = BookingBloc();
  List<HistoryModel>? historyList;

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

  listent() async {
    _bookingBloc.historyStream809.listen((event) {
      historyList = event;
    });

    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
    _bookingBloc.callWhat809(int.parse(_prefs!.getString('id')!));
  }

  void _onDismissed(BuildContext context, int index) {
    setState(() {
      historyList!.removeAt(index);
    });
  }

  Widget _buildCard(item) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        foregroundDecoration: BadgeDecoration(
            badgeColor: (item.Status == "0") ? Colors.red : Colors.green,
            badgeSize: 50,
            textSpan: TextSpan(
                text: item.Status == "0" ? "Not\n Confirmed" : "Confirmed",
                style: TextStyle(color: Colors.white, fontSize: 9))),
        child: ListTile(
          title: Text("${item.Name}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(convertBookingDay("${item.Start}")),
              FakeTextSpan(
                text1: "Duration: ",
                text2: calTotalTime(convertTime(item.Start.toString()),
                    convertTime(item.End.toString())),
              ),
              FakeTextSpan(
                text1: "Total: ",
                text2: "${item.Total}",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listCard() {
    return Expanded(
      flex: 14,
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  itemCount: historyList!.length,
                  itemBuilder: (context, index) {
                    final item = historyList![index];
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: [
                        IconSlideAction(
                          color: Colors.red[400],
                          icon: Icons.delete,
                          onTap: () async {
                            final _repo = Repository();
                            await _repo.r800BookingProvider
                                .p800Booking(803, {"listid": item.id});
                            _onDismissed(context, index);

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Deleted")));
                          },
                        )
                      ],
                      child: _buildCard(item),
                    );
                  })),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Text(
          'History',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: _bookingBloc.historyStream809,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(flex: 1, child: Text("swipe on an item to delete")),
                  _listCard(),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
