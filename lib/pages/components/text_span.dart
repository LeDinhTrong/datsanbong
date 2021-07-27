import 'package:field_for_rent/pages/constants.dart';
import 'package:flutter/material.dart';

class FakeTextSpan extends StatelessWidget {
  final String text1;
  final String text2;
  const FakeTextSpan({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: text1,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      TextSpan(text: text2, style: TextStyle(color: kPrimaryColor)),
    ]));
  }
}
