import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final List<Widget> actions;
  final Color bgColor;
  final Color textColor;

  CustomAppBar({
    Key? key,
    required this.title,
    required this.actions,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.bgColor,
      centerTitle: false,
      title: Text(
        widget.title,
        style: TextStyle(
            color: widget.textColor,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight),
      ),
      actions: widget.actions,
    );
  }
}
