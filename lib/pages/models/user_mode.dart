import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String name;
  final int phone;
  final String email;
  final String fieldName;
  final String dateTime;
  final int total;
  final int duration;
  final String status;
  final Color colorstatus;

  UserModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.fieldName,
    required this.dateTime,
    required this.total,
    required this.duration,
    required this.status,
    required this.colorstatus,
  });
}

final userModelList = [
  UserModel(
      name: "LDT",
      phone: 0342265597,
      email: "ldtrong@gmail.com",
      fieldName: "Strawberry Field",
      dateTime: "Tuesday, July 15, 2021",
      total: 360000,
      duration: 120,
      status: "Not\n Confirmed",
      colorstatus: Colors.red),
  UserModel(
      name: "LDT",
      phone: 0342265597,
      email: "ldtrong@gmail.com",
      fieldName: "Joshamtp Field",
      dateTime: "Tuesday, July 20, 2021",
      total: 200000,
      duration: 60,
      status: "Not\n Confirmed",
      colorstatus: Colors.red),
  UserModel(
      name: "LDT",
      phone: 0342265597,
      email: "ldtrong@gmail.com",
      fieldName: "Lapangan Field",
      dateTime: "Tuesday, July 25, 2021",
      total: 200000,
      duration: 60,
      status: "Confirmed",
      colorstatus: Colors.green),
  UserModel(
      name: "LDT",
      phone: 0342265597,
      email: "ldtrong@gmail.com",
      fieldName: "Penny Lano Field",
      dateTime: "Tuesday, July 25, 2021",
      total: 600000,
      duration: 120,
      status: "Confirmed",
      colorstatus: Colors.green),
];
