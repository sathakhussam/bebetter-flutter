import 'package:flutter/material.dart';

class CardModel {
  final String title;
  final String subtitle;
  final bool imageBackground;
  final int crossAxisCount;
  final int mainAxisCount;
  final Color backgroundColor;
  final bool isInfoCard;
  final bool folderIcon;
  final Widget? bottomLeftCornerWidget;
  final Widget? redirectTo;

  // for info card
  final String? value;
  final String? percentage;
  final String? valueText;

  CardModel({
    required this.title,
    required this.subtitle,
    required this.imageBackground,
    required this.crossAxisCount,
    required this.mainAxisCount,
    required this.backgroundColor,
    required this.isInfoCard,
    this.folderIcon = false,
    this.bottomLeftCornerWidget,
    this.redirectTo,
    this.value,
    this.percentage,
    this.valueText,
  });
}
