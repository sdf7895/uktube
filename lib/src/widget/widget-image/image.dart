import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MusicImage extends StatefulWidget {
  double width;
  double height;

  MusicImage({super.key, this.width = 50.0, this.height = 50.0});

  @override
  State<MusicImage> createState() => _MusicImageState();
}

class _MusicImageState extends State<MusicImage> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://source.unsplash.com/random/300×300',
      fit: BoxFit.cover,
      width: widget.width,
      height: widget.height,
    );
  }
}
