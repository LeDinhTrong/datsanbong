import 'package:field_for_rent/pages/components/badge.dart';
import 'package:field_for_rent/pages/components/slidable_action.dart';
import 'package:field_for_rent/pages/components/text_span.dart';
import 'package:field_for_rent/pages/models/user_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

List<UserModel> items = List.of(userModelList);

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'History',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(flex: 1, child: Text("swipe on an item to delete")),
          Expanded(
            flex: 14,
            child: Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            secondaryActions: [
                              IconSlideAction(
                                color: Colors.red[400],
                                icon: Icons.delete,
                                onTap: () {
                                  onDismissed(
                                      context, index, SlidableAction.delete);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Deleted")));
                                },
                              )
                            ],
                            child: buildCard(item),
                          );
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDismissed(BuildContext context, int index, SlidableAction action) {
    final item = items[index];
    setState(() => items.removeAt(index));
  }

  Widget buildCard(UserModel item) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          foregroundDecoration: BadgeDecoration(
              item: item,
              badgeColor: item.colorstatus,
              badgeSize: 50,
              textSpan: TextSpan(
                  text: item.status,
                  style: TextStyle(color: Colors.white, fontSize: 9))),
          child: ListTile(
            title: Text(item.fieldName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.dateTime),
                FakeTextSpan(
                  text1: "Duration: ",
                  text2: "${item.duration.toString()}'",
                ),
                FakeTextSpan(
                  text1: "Total: ",
                  text2: "${item.total.toString()} vnd/h",
                ),
              ],
            ),
          ),
        ),
      );
}
