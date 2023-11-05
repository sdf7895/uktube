import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/screen/screen-atour/atour.dart';
import 'package:youtube_music_clone_coding/src/screen/screen-home/home.dart';
import 'package:youtube_music_clone_coding/src/screen/screen-storageBox/storage-box.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-bottomNavi/bottom-navigation.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-music-player/music-mini-player.dart';

import '../../widget/widget-appbar/appbar.dart';
import '../../widget/widget-container/main-container.dart';

class EntryScreen extends StatefulWidget {
  EntryScreen({Key? key}) : super(key: key);

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  int _index = 0;
  bool _bottomStatus = true;
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appbar: CustomAppBar(
        title: "UKTUBE MUSIC",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        bgColor: Colors.black,
        textColor: Colors.white,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        isOpen: _bottomStatus,
        onChange: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      child: Stack(
        children: [
          _seletedScreen(),
          Positioned(
            bottom: 670,
            child: MusicMiniPlayer(
              isOpen: _bottomStatus,
            ),
          ),
        ],
      ),
    );
  }

  void changeBottomStatus({required bool status}) {
    setState(() {
      _bottomStatus = status;
    });
  }

  Widget _seletedScreen() {
    switch (_index) {
      case 0:
        return HomeScreen(
          itemOnClick: (status) {
            changeBottomStatus(status: !status);
          },
        );
      case 1:
        return const AtourScreen();
      case 2:
        return const StorageBoxScreen();
      default:
        return HomeScreen(
          itemOnClick: (status) {
            changeBottomStatus(status: !status);
          },
        );
    }
  }
}
