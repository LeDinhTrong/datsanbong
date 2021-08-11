import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:field_for_rent/blocs/b500_user_bloc.dart';
import 'package:field_for_rent/models/m500_user_model.dart';
import 'package:field_for_rent/pages/components/routes.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/edit_information.dart';
import 'package:field_for_rent/pages/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  SharedPreferences? _prefs;
  final _userBloc = UserBloc();
  List<M500UserModel>? userModelList;

  @override
  void initState() {
    super.initState();
    listent();
  }

  @override
  void dispose() {
    super.dispose();
    _userBloc.dispose();
  }

  listent() {
    _userBloc.userStream504.listen((event) {
      userModelList = event;
    });
    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
    _userBloc.callWhat504(int.parse(_prefs!.getString('id')!));
  }

  Widget inforAccount({required String text1, required String text2}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: text1,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
      TextSpan(text: text2, style: TextStyle(color: Colors.grey, fontSize: 18)),
    ]));
  }

  Widget _infoAccount(item) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        inforAccount(text1: "Name: ", text2: "${item.Name}"),
        inforAccount(text1: "Phone: ", text2: "${item.Phone}"),
        inforAccount(text1: "Email: ", text2: "${item.Email}"),
      ]),
    );
  }

  Widget button(
      {required String text,
      required Icon icon,
      required VoidCallback onPress}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: Colors.white,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18)),
              icon,
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Information",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        InkWell(
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditInfor()))
                  .then((value) {
                print(value);
                if (value == true) {
                  _userBloc.callWhat504(int.parse(_prefs!.getString('id')!));
                  setState(() {});
                }
              });
            },
            child: Text("change", style: TextStyle(color: kPrimaryColor)))
      ],
    );
  }

  Widget _userInfo(Size size, userModelList) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        height: 130,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
                size: size.height * 0.08,
              ),
              SizedBox(width: 16),

              // information account
              _infoAccount(userModelList!.first),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
          stream: _userBloc.userStream504,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data.length > 0
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      height: double.infinity,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _headerText(),
                            SizedBox(height: 50),
                            _userInfo(size, userModelList),
                            button(
                                text: "Faq",
                                icon: Icon(Icons.arrow_forward_ios_rounded),
                                onPress: () {}),
                            button(
                                text: "Help",
                                icon: Icon(Icons.arrow_forward_ios_rounded),
                                onPress: () {}),
                            button(
                                text: "Sign Out",
                                icon: Icon(Icons.arrow_forward_ios_rounded),
                                onPress: () async {
                                  if (await confirm(
                                    context,
                                    title: Text('Confirm'),
                                    content: Text(
                                        'Are you sure you want to log out?'),
                                    textOK: Text('Yes'),
                                    textCancel: Text('No'),
                                  )) {
                                    Navigator.pushReplacementNamed(
                                        context, loginRoute);
                                  }
                                }),
                          ],
                        ),
                      ),
                    )
                  : Center(child: Text("Emty"));
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error"));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
