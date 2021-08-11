import 'package:field_for_rent/pages/constants.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final dynamic validator;
  final TextEditingController controller;
  final String hintText;
  final errorText;
  final onChanged;
  const PasswordField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.errorText,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool showPass = true;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        obscureText: showPass,
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
          errorText: errorText,
          hintText: hintText,
          hintStyle: TextStyle(color: kPrimaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
