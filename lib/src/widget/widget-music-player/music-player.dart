import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-container/ratio-container.dart';

class MusicPlayer extends StatefulWidget {
  MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      ratioHeight: 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shuffle,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.fast_rewind,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_circle,
              color: Colors.white,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.fast_forward,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.replay,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
