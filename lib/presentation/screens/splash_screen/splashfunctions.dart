import 'package:amor_musics/DB/functions/db_functions.dart';
import 'package:amor_musics/DB/model/allsongmodel.dart';

import 'package:amor_musics/presentation/screens/home_screen/homescreen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreeenfunctions extends StatefulWidget {
  const SplashScreeenfunctions({super.key});

  @override
  State<SplashScreeenfunctions> createState() => _SplashScreeenfunctionsState();
}

final box = SongBox.getInstance();
//final mostplayedbox = MostPlayedBox.getInstance();
final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
List<SongModel> fetchallSongs = [];
List<SongModel> allsongs = [];

List<Audio> songslisting = [];
final OnAudioQuery audioQuery = OnAudioQuery();

class _SplashScreeenfunctionsState extends State<SplashScreeenfunctions> {
  late List<SongModel> songList;

  @override
  void initState() {
    openlikeddb();
    openrecentlyplayeddb();

    openplaylistdb();
    openmostlyplayeddb();
    requestPermission();
    
    navigationFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/image 14.png'),
      ),
    );
  }

  Future<void> navigationFunction() async {
    await Future.delayed(const Duration(seconds: 5));

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context1) => const HomeScreen())));
  }

  requestPermission() async {
    if (!kIsWeb) {
      bool status = await audioQuery.permissionsStatus();
      if (!status) {
        await Permission.notification.request();
        await audioQuery.permissionsRequest();

        fetchallSongs =
            await audioQuery.querySongs(orderType: OrderType.ASC_OR_SMALLER);

        for (var element in fetchallSongs) {
          if (element.fileExtension == "mp3") {
            allsongs.add(element);
          }
        }

        for (var element in allsongs) {
          box.add(AllSongModel(
              id: element.id,
              title: element.title,
              artist: element.artist,
              image: element.id,
              uri: element.uri,
              duration: element.duration));
        }
       
      }
    }
  }
}
