import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RatioContainer extends StatefulWidget {
  double ratioWidth;
  double ratioHeight;
  Widget child;
  Color bgColor;
  RatioContainer({
    super.key,
    required this.child,
    this.bgColor = Colors.white,
    this.ratioWidth = 1.0,
    this.ratioHeight = 1.0,
  });

  @override
  State<RatioContainer> createState() => _RatioContainerState();
}

class _RatioContainerState extends State<RatioContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      width: MediaQuery.sizeOf(context).width * widget.ratioWidth,
      height: MediaQuery.sizeOf(context).height * widget.ratioHeight,
      child: widget.child,
    );
  }
}
