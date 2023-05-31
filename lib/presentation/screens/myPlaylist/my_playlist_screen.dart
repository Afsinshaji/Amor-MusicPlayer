import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/addplaylist/addPlaylistname.dart';
import 'package:amor_musics/presentation/screens/library/library_screen.dart';
import 'package:amor_musics/presentation/screens/myPlaylist/my_playlist_functions.dart';
import 'package:flutter/material.dart';

class MyPlaylistScreen extends StatelessWidget {
  const MyPlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        titleSpacing: 60,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: otherTextColor,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const LibraryScreen())));
          },
        ),
        title: Text(
          'My Playlist',
          style: TextStyle(color: otherTextColor, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AddPlaylistName.editValue.value = -1;
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => AddPlaylistName())));
            },
            icon: Icon(
              Icons.add,
              color: otherTextColor,
              size: 35,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body:  MyPlaylistFunction(),
    );
  }
}
