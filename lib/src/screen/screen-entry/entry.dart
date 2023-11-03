import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/screen/screen-atour/atour.dart';
import 'package:youtube_music_clone_coding/src/screen/screen-home/home.dart';
import 'package:youtube_music_clone_coding/src/screen/screen-storageBox/storage-box.dart';
import 'package:youtube_music_clone_coding/src/widget/widget-bottomNavi/bottom-navigation.dart';

import '../../widget/widget-appbar/appbar.dart';
import '../../widget/widget-container/main-container.dart';

class EntryScreen extends StatefulWidget {
  EntryScreen({Key? key}) : super(key: key);

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  int _index = 0;
  final GlobalKey<CustomBottomNavigationState> _bottomNavigationStateKey =
      GlobalKey<CustomBottomNavigationState>();

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
        key: _bottomNavigationStateKey,
        onChange: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      child: _seletedScreen(),
    );
  }

  Widget _seletedScreen() {
    switch (_index) {
      case 0:
        return HomeScreen(
          globalBottomKey: _bottomNavigationStateKey,
        );
      case 1:
        return const AtourScreen();
      case 2:
        return const StorageBoxScreen();
      default:
        return HomeScreen(
          globalBottomKey: _bottomNavigationStateKey,
        );
    }
  }
}
