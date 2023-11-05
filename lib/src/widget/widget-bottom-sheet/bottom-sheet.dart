import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-container/ratio-container.dart';

// ignore: must_be_immutable
class BottomSheetWidget extends StatefulWidget {
  bool isOpen;
  Color bgColor;
  Widget child;
  double ratioWidth;
  double ratioHeight;

  Function(bool status)? onCurrentStatus;

  BottomSheetWidget({
    super.key,
    required this.child,
    this.bgColor = Colors.white,
    this.isOpen = false,
    this.ratioWidth = 1,
    this.ratioHeight = 1,
    this.onCurrentStatus,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget>
    with SingleTickerProviderStateMixin {
  double _offset = 0.0;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _offsetAnimation,
          child: GestureDetector(
            onPanUpdate: (details) {
              bottomDownUpdate(details: details);
            },
            onPanEnd: (details) {
              bottomUpUpdate();
            },
            child: RatioContainer(
              margin: _offset,
              bgColor: widget.bgColor,
              ratioWidth: widget.ratioWidth,
              ratioHeight: widget.ratioHeight,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }

  void bottomDownUpdate({required DragUpdateDetails details}) {
    double y = details.delta.dy;

    setState(
      () {
        y = y / 2;

        if (_offset + y < 0) {
          _offset = 0.0;
        } else if (_offset > MediaQuery.of(context).size.height / 20) {
          if (widget.onCurrentStatus != null) {
            widget.onCurrentStatus!(false);
          }
          _controller.reverse();
        } else {
          _offset += y;
        }
      },
    );
  }

  void bottomUpUpdate() {
    if (_offset < MediaQuery.of(context).size.height / 20) {
      setState(() {
        if (widget.onCurrentStatus != null) {
          widget.onCurrentStatus!(widget.isOpen);
        }
        _offset = 0.0;
      });
      _controller.forward();
    }
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

    if (widget.isOpen) {
      _controller.forward();
      setState(() {
        _offset = 0.0;
      });
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
