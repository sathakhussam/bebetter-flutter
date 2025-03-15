import 'package:bebetter/models/card.model.dart';
import 'package:bebetter/pages/home.page.dart';
import 'package:bebetter/pages/login.page.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final CardModel card;

  const CustomCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => card.redirectTo ?? HomePage(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 167,
          decoration: BoxDecoration(
            color: card.backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              if (card.imageBackground) ...[
                Image.asset(
                  'assets/images/texture.png',
                  fit: BoxFit.cover,
                  height: 90,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: RadialGradient(
                      center: const Alignment(-0.9, -1.3),
                      radius: 0.8,
                      colors: [
                        card.backgroundColor.withOpacity(0),
                        card.backgroundColor.withOpacity(0.3),
                        card.backgroundColor,
                      ],
                    ),
                  ),
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (card.folderIcon)
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Image.asset('assets/images/folder.webp'),
                          ),
                        SizedBox(height: 8),
                        Text(
                          card.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          card.subtitle,
                          style: const TextStyle(
                            fontSize: 8,
                            color: Colors.white60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  card.bottomLeftCornerWidget ?? SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
