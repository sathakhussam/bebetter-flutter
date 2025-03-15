import 'dart:ui';

import 'package:bebetter/models/card.model.dart';
import 'package:bebetter/pages/complaint.page.dart';
import 'package:bebetter/pages/instruction.page.dart';
import 'package:bebetter/pages/report.page.dart';
import 'package:bebetter/pages/rewards.page.dart';
import 'package:flutter/material.dart';

class AssignedClassesController {
  List<CardModel> getCards() {
    return [
      CardModel(
        title: "Reports",
        subtitle: "Have a concern?",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 2,
        backgroundColor: Colors.black,
        isInfoCard: false,
        folderIcon: true,
        redirectTo: ReportPage(),
      ),
      CardModel(
        title: "Complaints",
        subtitle: "You see a problem? No problem",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        folderIcon: true,
        redirectTo: ComplaintPage(),
      ),
      CardModel(
        title: "Instructions",
        subtitle: "Learn then earn",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Colors.black,
        isInfoCard: false,
        folderIcon: true,
        redirectTo: InstructionPage(),
      ),
    ];
  }
}

class StudentController {
  List<StudentModel> getCards() {
    return [
      StudentModel(name: "Bhavesh Bellaney", attendance: "42", details: [
        {
          "title": "Vehicle Number",
          "value": "MH 12 1234",
        },
        {
          "title": "Vehicle Type",
          "value": "Car",
        },
        {
          "title": "Vehicle Model",
          "value": "Toyota",
        },
        {
          "title": "Vehicle Color",
          "value": "Black",
        }
      ]),
    ];
  }
}

class StudentModel {
  String name;
  String attendance;
  List<Map<String, String>> details;

  StudentModel(
      {required this.name, required this.attendance, required this.details});
}
