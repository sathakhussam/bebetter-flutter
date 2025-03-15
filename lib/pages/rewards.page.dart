import 'package:bebetter/components/custom_card.component.dart';
import 'package:bebetter/components/expansion_tile.component.dart';
import 'package:bebetter/components/vehicle_card.component.dart';
import 'package:bebetter/controller/rewards.controller.dart';
import 'package:bebetter/models/card.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  late final AssignedClassesController assignedClassesController;
  late final StudentController assignedStudentController;
  late List<CardModel> cards;

  @override
  void initState() {
    super.initState();
    assignedClassesController = AssignedClassesController();
    assignedStudentController = StudentController();
    cards = assignedClassesController.getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Column(
          children: [
            const Text(
              "Rewards",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
            ),
            const Text(
              "Earn Merits & Cash",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 0.4),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/svgs/contact.svg'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) => CustomCard(card: cards[index]),
                separatorBuilder: (context, index) => SizedBox(width: 8),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Students Stats',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SvgPicture.asset('assets/svgs/stats.svg'),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: assignedStudentController.getCards().length,
                separatorBuilder: (context, index) => SizedBox(height: 9),
                itemBuilder: (context, index) {
                  return ExpandableTile(
                    index: index,
                    tile: (isExpanded) => VehicleTileWidget(
                      student: assignedStudentController.getCards()[index],
                      isExpanded: isExpanded,
                      index: index + 1,
                    ),
                    expandedWidget: StudentExpandedTileWidget(
                      student: assignedStudentController.getCards()[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
