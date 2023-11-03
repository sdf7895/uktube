import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-container/ratio-container.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-image/image.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-music-player/music-player.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-music-progress/music-progress.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          MusicImage(
            width: 400,
            height: 400,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              '테스트 제목',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          MusicProgressBar(),
          MusicPlayer(),
        ],
      ),
    );
  }
}
