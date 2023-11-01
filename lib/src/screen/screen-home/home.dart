import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/detail/detail-fast-music-item.dart';
import 'package:youtube_music_clone_coding/src/detail/detail-music-list-item.dart';
import 'package:youtube_music_clone_coding/src/texts/strings.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-container/ratio-container.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-listView/list-view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RatioContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: makeStartMusicListViewWidgets()),
            Column(children: makeTitleListViewWidgets()),
          ],
        ),
      ),
    );
  }

  List<TitleListViewWidget> makeStartMusicListViewWidgets() {
    return [
      TitleListViewWidget(
        heightRatio: 0.35,
        title: "빠른 선곡",
        itemCount: 5,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              FastMusicItem(
                item: FastMusicListItemModel(
                    title: '테스트',
                    thumbnailUrl: 'https://source.unsplash.com/random/300×300',
                    singer: '테스트가수'),
              ),
              FastMusicItem(
                item: FastMusicListItemModel(
                    title: '테스트',
                    thumbnailUrl: 'https://source.unsplash.com/random/300×300',
                    singer: '테스트가수'),
              ),
              FastMusicItem(
                item: FastMusicListItemModel(
                    title: '테스트',
                    thumbnailUrl: 'https://source.unsplash.com/random/300×300',
                    singer: '테스트가수'),
              ),
              FastMusicItem(
                item: FastMusicListItemModel(
                    title: '테스트',
                    thumbnailUrl: 'https://source.unsplash.com/random/300×300',
                    singer: '테스트가수'),
              )
            ],
          );
        },
      )
    ];
  }

  List<TitleListViewWidget> makeTitleListViewWidgets() {
    return listVivewitems
        .map(
          (item) => TitleListViewWidget(
            heightRatio: 0.25,
            title: item.title,
            itemCount: item.itemCount,
            itemBuilder: (BuildContext context, index) {
              return MusicListItem(
                item: MusicListItemModel(
                    title: item.subTitle,
                    thumbnailUrl: item.thumbnailUrl,
                    singer: item.singer),
              );
            },
          ),
        )
        .toList();
  }

  List<TitleListViewWidgetModel> listVivewitems = [
    TitleListViewWidgetModel(
      title: HedaerTitleMusic.headerTitle,
      fontSize: 30,
      itemCount: 10,
      subTitle: '테스트',
      thumbnailUrl: 'https://source.unsplash.com/random/300×300',
      singer: '테스트가수',
    ),
    TitleListViewWidgetModel(
      title: HedaerTitleMusic.headerTitle2,
      fontSize: 25,
      itemCount: 10,
      subTitle: '테스트',
      thumbnailUrl: 'https://source.unsplash.com/random/300×300',
      singer: '테스트가수',
    ),
    TitleListViewWidgetModel(
      title: HedaerTitleMusic.headerTitle3,
      fontSize: 25,
      itemCount: 10,
      subTitle: '테스트',
      thumbnailUrl: 'https://source.unsplash.com/random/300×300',
      singer: '테스트가수',
    ),
    TitleListViewWidgetModel(
      title: HedaerTitleMusic.headerTitle4,
      fontSize: 25,
      itemCount: 10,
      subTitle: '테스트',
      thumbnailUrl: 'https://source.unsplash.com/random/300×300',
      singer: '테스트가수',
    ),
  ];
}

class TitleListViewWidgetModel {
  String title;
  int fontSize;
  int itemCount;
  String subTitle;
  String thumbnailUrl;
  String singer;

  TitleListViewWidgetModel({
    required this.title,
    required this.fontSize,
    required this.itemCount,
    required this.subTitle,
    required this.thumbnailUrl,
    required this.singer,
  });
}
