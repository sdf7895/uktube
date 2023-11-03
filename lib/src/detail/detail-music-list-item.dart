import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-container/ratio-container.dart';

// ignore: must_be_immutable
class MusicListItem extends StatelessWidget {
  MusicListItemModel item;

  MusicListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RatioContainer(
        ratioWidth: 0.35,
        ratioHeight: 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item.thumbnailUrl,
              fit: BoxFit.cover,
              width: 200,
              height: 150,
            ),
            Text(
              item.title,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              item.singer,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicListItemModel {
  String title;
  String thumbnailUrl;
  String singer;

  MusicListItemModel({
    required this.title,
    required this.thumbnailUrl,
    required this.singer,
  });
}
