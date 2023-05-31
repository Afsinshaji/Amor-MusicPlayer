import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/account/account_screen.dart';
import 'package:amor_musics/presentation/screens/downloads/downloads_screen.dart';
import 'package:amor_musics/presentation/screens/home_screen/homescreen.dart';
import 'package:amor_musics/presentation/screens/library/library_screen.dart';
import 'package:amor_musics/presentation/screens/liked_songs/liked_songs_screen.dart';
import 'package:amor_musics/presentation/screens/mostplayed/most_played_screen.dart';
import 'package:amor_musics/presentation/screens/recentlyplayed/recently_played_screen.dart';
import 'package:amor_musics/presentation/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class DrawerFunctions extends StatelessWidget {
  const DrawerFunctions({super.key});

  @override
  Widget build(BuildContext context) {
    return drawerList(context);
  }

  Widget drawerList(BuildContext context) {
    return Container(
      width: 250,
      color: basecolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.only(left: 230),
            child: IconButton(
              icon: const Icon(
                Icons.close,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HomeScreen())));
              },
            ),
          ),
          drawerListTile(
              Icon(
                Icons.account_circle,
                color: baseTextColor,
                size: 35,
              ),
              'Account',
              context,
              const AccountScreen()),
          drawerListTile(
              Icon(
                Icons.favorite,
                color: baseTextColor,
                size: 35,
              ),
              'Liked Songs',
              context,
              const LikedSongsScreen()),
          drawerListTile(
              Icon(
                Icons.disc_full,
                color: baseTextColor,
                size: 35,
              ),
              'Most Played',
              context,
              const MostPlayedScreen()),
          drawerListTile(
              Icon(
                Icons.shuffle,
                color: baseTextColor,
                size: 35,
              ),
              'Recently Played',
              context,
              const RecentlyPlayedScreen()),
          drawerListTile(
              Icon(
                Icons.download,
                color: baseTextColor,
                size: 35,
              ),
              'Downloads',
              context,
              const DownloadsScreen()),
          drawerListTile(
              Icon(
                Icons.book,
                color: baseTextColor,
                size: 35,
              ),
              'Library',
              context,
              const LibraryScreen()),
          drawerListTile(
              Icon(
                Icons.settings,
                color: baseTextColor,
                size: 35,
              ),
              'Settings',
              context,
              const SettingsScreen()),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
            child: const Text(
              'Change Theme',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (() {
                  basecolor = Colors.teal;
                }),
                child: Container(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.circle,
                    color: basecolor,
                    size: 10,
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  basecolor = Colors.lightBlue;
                }),
                child: Container(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.circle,
                    color: basecolor,
                    size: 10,
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  basecolor = Colors.cyan;
                }),
                child: Container(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.circle,
                    color: basecolor,
                    size: 10,
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  basecolor = Colors.blueGrey;
                }),
                child: Container(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.circle,
                    color: basecolor,
                    size: 10,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  colorCard(var color) {
    Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: color,
      ),
      child: const Text(''),
    );
  }

  Widget drawerListTile(
      // ignore: non_constant_identifier_names
      Icon icon, String title, BuildContext context, Widget Page) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => Page)));
      },
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(color: otherTextColor, fontSize: 16),
        ),
      ),
    );
  }
}
