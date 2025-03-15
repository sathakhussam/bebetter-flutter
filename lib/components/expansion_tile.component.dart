import 'package:flutter/material.dart';

class ExpandableTile extends StatefulWidget {
  final Widget Function(bool) tile;
  final Widget expandedWidget;
  final int index;

  const ExpandableTile({
    required this.tile,
    required this.expandedWidget,
    required this.index,
    super.key,
  });

  @override
  State<ExpandableTile> createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: widget.tile(isExpanded),
        ),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          child: isExpanded ? widget.expandedWidget : SizedBox.shrink(),
        ),
      ],
    );
  }
}
