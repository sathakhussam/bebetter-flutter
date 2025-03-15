import 'package:bebetter/models/card.model.dart';
import 'package:bebetter/pages/complaint.page.dart';
import 'package:bebetter/pages/instruction.page.dart';
import 'package:bebetter/pages/report.page.dart';
import 'package:bebetter/pages/rewards.page.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<CardModel> getCards() {
    return [
      CardModel(
        title: "Reports",
        subtitle: "Have a concern?",
        imageBackground: true,
        crossAxisCount: 2,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        bottomLeftCornerWidget: Image.asset(
          'assets/images/workspace.webp',
          height: 80,
        ),
        redirectTo: ReportPage(),
      ),
      CardModel(
        title: "Complaints",
        subtitle: "You see a problem? No problem",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 2,
        backgroundColor: Colors.black,
        isInfoCard: false,
        folderIcon: true,
        redirectTo: ComplaintPage(),
      ),
      CardModel(
        title: "Your Rewards",
        subtitle: "Earn merit and cash",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        folderIcon: true,
        redirectTo: RewardsPage(),
      ),
      CardModel(
        title: "Instructions",
        subtitle: "Learn then earn",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        folderIcon: true,
        redirectTo: InstructionPage(),
      ),
    ];
  }
}
