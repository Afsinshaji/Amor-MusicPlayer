import 'package:amor_musics/core/colors/color.dart';

import 'package:amor_musics/presentation/screens/NowplayingWidget/now_playiing_Screen_functions.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CurrentPlayingScreen extends StatelessWidget {
  CurrentPlayingScreen({super.key, required this.id});

  int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        titleSpacing: 30,
        title: Text(
          'Playing Now',
          style: TextStyle(
            color: otherTextColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 80,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: otherTextColor,
            size: 40,
          ),
          onPressed: (() {
            Navigator.pop(context);
          }),
        ),
      ),
      body: CurrentPlayingFunction4(id: id),
    );
  }
}
