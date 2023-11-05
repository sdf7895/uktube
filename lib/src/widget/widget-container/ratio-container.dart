import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RatioContainer extends StatefulWidget {
  double ratioWidth;
  double ratioHeight;
  double margin;
  double padding;
  Widget child;
  Color bgColor;
  RatioContainer({
    super.key,
    required this.child,
    this.bgColor = Colors.black,
    this.ratioWidth = 1.0,
    this.ratioHeight = 1.0,
    this.margin = 0.0,
    this.padding = 0.0,
  });

  @override
  State<RatioContainer> createState() => _RatioContainerState();
}

class _RatioContainerState extends State<RatioContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.padding),
      child: Container(
        margin: EdgeInsets.only(top: widget.margin),
        color: widget.bgColor,
        width: MediaQuery.sizeOf(context).width * widget.ratioWidth,
        height: MediaQuery.sizeOf(context).height * widget.ratioHeight,
        child: widget.child,
      ),
    );
  }
}
