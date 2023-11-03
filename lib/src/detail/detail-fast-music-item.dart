import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-container/ratio-container.dart';

// ignore: must_be_immutable
class FastMusicItem extends StatelessWidget {
  FastMusicListItemModel item;
  FastMusicItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onClick,
      child: RatioContainer(
        ratioWidth: 0.9,
        ratioHeight: 0.08,
        child: Row(
          children: [
            Image.network(
              item.thumbnailUrl,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    item.singer,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                // 버튼이 눌렸을 때 수행할 작업을 여기에 작성
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FastMusicListItemModel {
  String title;
  String thumbnailUrl;
  String singer;
  Function() onClick;

  FastMusicListItemModel({
    required this.title,
    required this.thumbnailUrl,
    required this.singer,
    required this.onClick,
  });
}
