import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/detail/detail-fast-music-item.dart';
import 'package:youtube_music_clone_coding/src/detail/detail-music-list-item.dart';
import 'package:youtube_music_clone_coding/src/detail/detail-music-screen.dart';
import 'package:youtube_music_clone_coding/src/texts/strings.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-bottom-sheet/bottom-sheet.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-container/ratio-container.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-listView/list-view.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  Function(bool status) itemOnClick;
  HomeScreen({
    super.key,
    required this.itemOnClick,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _bottomSheetStatus = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RatioContainer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(children: makeStartMusicListViewWidgets()),
                Column(children: makeTitleListViewWidgets()),
              ],
            ),
          ),
        ),
        BottomSheetWidget(
          bgColor: Colors.black,
          isOpen: _bottomSheetStatus,
          child: MusicScreen(onItemClick: (status) {
            _handleBottomSheetStatus(status: status);
            widget.itemOnClick(status);
          }),
          onCurrentStatus: (status) {
            widget.itemOnClick(status);

            setState(() {
              _bottomSheetStatus = status;
            });
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void _handleBottomSheetStatus({required bool status}) {
    setState(() {
      _bottomSheetStatus = status;
    });
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
                  title: '너였다면',
                  thumbnailUrl: 'https://source.unsplash.com/random/300×300',
                  singer: '정승환',
                  onClick: () {
                    _handleBottomSheetStatus(status: true);
                    widget.itemOnClick(_bottomSheetStatus);
                  },
                ),
              ),
              FastMusicItem(
                item: FastMusicListItemModel(
                  title: 'With me',
                  thumbnailUrl: 'https://source.unsplash.com/random/300×300',
                  singer: '휘성',
                  onClick: () {},
                ),
              ),
              FastMusicItem(
                item: FastMusicListItemModel(
                  title: '외톨이야',
                  thumbnailUrl: 'https://source.unsplash.com/random/300×300',
                  singer: '씨엔블루',
                  onClick: () {},
                ),
              ),
              FastMusicItem(
                item: FastMusicListItemModel(
                  title: '좋은사람',
                  thumbnailUrl: 'https://source.unsplash.com/random/300×300',
                  singer: '박효신',
                  onClick: () {},
                ),
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
            heightRatio: 0.30,
            title: item.title,
            itemCount: item.itemCount,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {},
                child: MusicListItem(
                  item: MusicListItemModel(
                      title: item.subTitle,
                      thumbnailUrl: item.thumbnailUrl,
                      singer: item.singer),
                ),
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
      subTitle: '너였다면',
      thumbnailUrl: 'https://source.unsplash.com/random/300×300',
      singer: '정승환',
    ),
    TitleListViewWidgetModel(
      title: HedaerTitleMusic.headerTitle2,
      fontSize: 25,
      itemCount: 10,
      subTitle: 'With me',
      thumbnailUrl: 'https://source.unsplash.com/random/300×300',
      singer: '휘성',
    ),
    TitleListViewWidgetModel(
      title: HedaerTitleMusic.headerTitle3,
      fontSize: 25,
      itemCount: 10,
      subTitle: '외톨이야',
      thumbnailUrl: 'https://source.unsplash.com/random/300×300',
      singer: '씨엔블루',
    ),
    TitleListViewWidgetModel(
      title: HedaerTitleMusic.headerTitle4,
      fontSize: 25,
      itemCount: 10,
      subTitle: '좋은사람',
      thumbnailUrl: 'https://source.unsplash.com/random/300×300',
      singer: '박효신',
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
