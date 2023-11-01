import 'package:flutter/material.dart';

import '../widget-container/ratio-container.dart';

// ignore: must_be_immutable
class TitleListViewWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final double heightRatio;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  TitleListViewWidget({
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
    required this.heightRatio,
    this.fontSize = 20,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          RatioContainer(
            ratioHeight: heightRatio,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: itemBuilder),
          )
        ],
      ),
    );
  }
}
