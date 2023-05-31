import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/recentlyplayed/recentlyplayedfunctions.dart';
import 'package:flutter/material.dart';

class RecentlyPlayedScreen extends StatelessWidget {
  const RecentlyPlayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Recently Played',
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                restore();
              },
              icon: const Icon(
                Icons.replay_circle_filled,
                size: 35,
              ))
        ],
      ),
      body:  SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: RecentlyPlayedFunctions(),
      )),
    );
  }
}
