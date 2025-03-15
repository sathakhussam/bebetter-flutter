import 'package:bebetter/models/card.model.dart';
import 'package:flutter/material.dart';

class InfoCustomCard extends StatelessWidget {
  final CardModel card;

  const InfoCustomCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: card.backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              card.title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_upward_outlined,
                    color: card.backgroundColor,
                    size: 8,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: " ${card.percentage ?? ""} ",
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                    children: [
                      TextSpan(
                        text: card.subtitle,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Text.rich(
              TextSpan(
                text: "${card.value ?? ""} ",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  height: 0,
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  TextSpan(
                    text: card.valueText,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
