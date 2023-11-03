import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-container/ratio-container.dart';

// ignore: must_be_immutable
class BottomSheetWidget extends StatefulWidget {
  bool isOpen;
  Color bgColor;
  Widget child;
  double ratioWidth;
  double ratioHeight;

  BottomSheetWidget({
    super.key,
    required this.child,
    this.bgColor = Colors.white,
    this.isOpen = false,
    this.ratioWidth = 1,
    this.ratioHeight = 1,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _offsetAnimation,
          child: RatioContainer(
            bgColor: widget.bgColor,
            ratioWidth: widget.ratioWidth,
            ratioHeight: widget.ratioHeight,
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.5),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    if (widget.isOpen) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(BottomSheetWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('check sheet');
    if (widget.isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
