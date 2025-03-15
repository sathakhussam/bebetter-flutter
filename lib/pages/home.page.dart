import 'package:bebetter/components/custom_card.component.dart';
import 'package:bebetter/components/info_custom_card.component.dart';
import 'package:bebetter/controller/home.controller.dart';
import 'package:bebetter/models/card.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController();
  late final List<CardModel> cards;

  @override
  void initState() {
    super.initState();
    cards = _homeController.getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            SizedBox(width: 16.0),
            SvgPicture.asset(
              'assets/svgs/user.svg',
              height: 40,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sathak Hussam",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                ),
                const Text(
                  "sathakhussam@gmail.com",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                ),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            borderRadius: BorderRadius.circular(8.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset('assets/svgs/logout.svg'),
            ),
          ),
          SizedBox(width: 16)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: StaggeredGrid.extent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            children: cards.map((card) {
              return StaggeredGridTile.extent(
                crossAxisCellCount: card.crossAxisCount,
                mainAxisExtent: card.isInfoCard ||
                        (card.mainAxisCount == 1 && card.crossAxisCount == 2)
                    ? 100
                    : card.mainAxisCount == 1
                        ? 140
                        : 296,
                child: card.isInfoCard
                    ? InfoCustomCard(card: card)
                    : CustomCard(card: card),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
