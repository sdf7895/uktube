import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-appbar/appbar.dart';

// ignore: must_be_immutable
class MainContainer extends StatefulWidget {
  CustomAppBar appbar;
  Widget child;
  Widget bottomNavigationBar;
  double ratioWidth;
  double ratioHeight;

  MainContainer({
    super.key,
    required this.appbar,
    required this.child,
    required this.bottomNavigationBar,
    this.ratioWidth = 1.0,
    this.ratioHeight = 1.0,
  });

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appbar,
      body: Container(
        width: MediaQuery.sizeOf(context).width * widget.ratioWidth,
        height: MediaQuery.sizeOf(context).height * widget.ratioHeight,
        child: widget.child,
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
