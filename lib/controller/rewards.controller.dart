import 'dart:ui';

import 'package:bebetter/models/card.model.dart';

class AssignedClassesController {
  List<CardModel> getCards() {
    return [
      CardModel(
        title: "Announcements",
        subtitle: "Your classroom awaits you",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        folderIcon: true,
      ),
      CardModel(
        title: "Announcements",
        subtitle: "Your classroom awaits you",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        folderIcon: true,
      ),
      CardModel(
        title: "Announcements",
        subtitle: "Your classroom awaits you",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        folderIcon: true,
      ),
      CardModel(
        title: "Announcements",
        subtitle: "Your classroom awaits you",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        folderIcon: true,
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
