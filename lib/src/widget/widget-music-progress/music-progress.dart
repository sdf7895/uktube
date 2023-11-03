import 'package:flutter/material.dart';

class MusicProgressBar extends StatefulWidget {
  const MusicProgressBar({super.key});

  @override
  State<MusicProgressBar> createState() => _MusicProgressBarState();
}

class _MusicProgressBarState extends State<MusicProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Colors.grey,
      inactiveColor: Colors.grey.withOpacity(0.5),
      value: 0,
      min: 0.0,
      max: 1.0,
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}
