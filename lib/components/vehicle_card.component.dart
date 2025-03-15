import 'package:bebetter/controller/rewards.controller.dart';
import 'package:flutter/material.dart';

class VehicleTileWidget extends StatelessWidget {
  const VehicleTileWidget({
    required this.student,
    required this.isExpanded,
    required this.index,
    super.key,
  });
  final StudentModel student;
  final bool isExpanded;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.3),
      ),
      child: Row(
        children: [
          Container(
            height: 39,
            width: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF006FFD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              index.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vehicle Number",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ),
              Text(
                student.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Spacer(),
          AnimatedRotation(
            turns: isExpanded ? 0.5 : 0,
            duration: Duration(milliseconds: 300),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF006FFD),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class StudentExpandedTileWidget extends StatelessWidget {
  const StudentExpandedTileWidget({required this.student, super.key});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(top: 18, left: 10, right: 10, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: Color(0xFFF3F3F3),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...(student.details
                .map((detail) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detail['title'] ?? '',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        ),
                        Text(
                          detail['value'] ?? '',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4),
                      ],
                    ))
                .toList()),
          ],
        ),
      ),
    );
  }
}
