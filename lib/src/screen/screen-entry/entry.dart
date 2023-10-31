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
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appbar: CustomAppBar(
        title: "UKTUBE MUSIC",
        actions: [],
        bgColor: Colors.black,
        textColor: Colors.white,
      ),
      bottomNavigationBar: CustomBottomNavigation(
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
        return HomeScreen();
      case 1:
        return AtourScreen();
      case 2:
        return StorageBoxScreen();
      default:
        return HomeScreen();
    }
  }
}
