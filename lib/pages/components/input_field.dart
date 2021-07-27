import 'package:field_for_rent/pages/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final dynamic validator;
  final onChanged;
  final TextEditingController controller;
  final String hintText;
  const InputField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 10,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: kPrimaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
