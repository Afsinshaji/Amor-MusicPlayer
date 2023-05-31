// ignore_for_file: non_constant_identifier_names

import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/allsongs/all_songs.dart';
import 'package:amor_musics/presentation/screens/liked_songs/liked_songs_screen.dart';
import 'package:amor_musics/presentation/screens/mostplayed/most_played_screen.dart';
import 'package:amor_musics/presentation/screens/myPlaylist/my_playlist_screen.dart';
import 'package:amor_musics/presentation/screens/recentlyplayed/recently_played_screen.dart';
import 'package:flutter/material.dart';

class LibraryFunctions extends StatelessWidget {
  const LibraryFunctions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: libraryTileFunctions(context));
  }

  Widget libraryTileFunctions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Wrap(
        children: [
          libraryTile(
              'All Songs',
              Icon(
                Icons.file_present,
                color: basecolor,
              ),
              context,
              const AllSongsScreen()),
          libraryTile('Liked Songs', Icon(Icons.favorite, color: basecolor),
              context, const LikedSongsScreen()),
          libraryTile(
              'Recently Played',
              Icon(
                Icons.shuffle,
                color: basecolor,
              ),
              context,
              const RecentlyPlayedScreen()),
          libraryTile(
              'Most Played',
              Icon(
                Icons.disc_full,
                color: basecolor,
              ),
              context,
              const MostPlayedScreen()),
          libraryTile(
              'My Playlist',
              Icon(
                Icons.star,
                color: basecolor,
              ),
              context,
              const MyPlaylistScreen())
        ],
      ),
    );
  }

  libraryTile(String title, Icon icon, BuildContext context, Widget Page) {
    return ListTile(
      leading: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Page)));
        },
        child: Card(
            color: baseTextColor,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: icon,
            )),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
      ),
    );
  }
}
