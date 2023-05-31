import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/liked_songs/liked_songs_functions.dart';
import 'package:flutter/material.dart';

class LikedSongsScreen extends StatelessWidget {
  const LikedSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Liked Songs', style: TextStyle(color: Colors.white)),
      ),
      body:  LikedSongsFunctions(),
    );
  }
}
