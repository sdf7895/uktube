import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-container/ratio-container.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-image/image.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-music-player/music-player.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-music-progress/music-progress.dart';

// ignore: must_be_immutable
class MusicScreen extends StatefulWidget {
  Function(bool status) onItemClick;

  MusicScreen({
    super.key,
    required this.onItemClick,
  });

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
          MusicHeader(
            onItemClick: (status) {
              widget.onItemClick(status);
            },
          ),
          MusicImage(
            width: 400,
            height: 400,
          ),
          const MusicText(),
          const MusicProgressBar(),
          MusicPlayer(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MusicHeader extends StatelessWidget {
  Function(bool status) onItemClick;
  MusicHeader({
    super.key,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            onItemClick(false);
          },
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}

class MusicText extends StatelessWidget {
  const MusicText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: const Text(
        '테스트 제목',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
      ),
    );
  }
}
