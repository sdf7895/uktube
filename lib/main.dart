import 'package:flutter/material.dart';
import 'package:youtube_music_clone_coding/src/screen/screen-entry/entry.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntryScreen(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
    );
  }
}
