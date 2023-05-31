import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/DB/model/likedsongsmodel.dart';

import 'package:amor_musics/DB/model/playlistmodel.dart';
import 'package:amor_musics/DB/model/recentlyplayed.dart';
import 'package:amor_musics/bloc/allsongs/allsongs_bloc.dart';
import 'package:amor_musics/bloc/nowplaying/nowplaying_bloc.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/splash_screen/splashfunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'DB/model/mostlyPlayedSongModel.dart';
import 'bloc/liked/liked_bloc.dart';
import 'bloc/mostlyplayed/mostlyplayed_bloc.dart';
import 'bloc/playlist/playlist_bloc.dart';
import 'bloc/recentlyplayed/recentlyplayed_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(AllSongModelAdapter());
  await Hive.openBox<AllSongModel>('');

  Hive.registerAdapter(LikedSongModelAdapter());
  await Hive.openBox<LikedSongModel>('likedsongs');

  Hive.registerAdapter(RecentlyPlayedSongModelAdapter());
  await Hive.openBox<RecentlyPlayedSongModel>('recentlyplayedsongs');

  Hive.registerAdapter(PlayListModelAdapter());
  await Hive.openBox<PlayListModel>('playlistsongs');

  Hive.registerAdapter(MostlyPlayedSongModelAdapter());
  await Hive.openBox<MostlyPlayedSongModel>('MostlyPlayedBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllsongsBloc(),
        ),
        BlocProvider(
          create: (context) => MostlyplayedBloc(),
        ),
        BlocProvider(
          create: (context) => RecentlyplayedBloc(),
        ),
        BlocProvider(
          create: (context) => LikedBloc(),
        ),
        BlocProvider(
          create: (context) => PlaylistBloc(),
        ),
        BlocProvider(
          create: (context) => NowplayingBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amor Music',
        theme: ThemeData(
          primarySwatch: basecolor,
        ),
        home: const SplashScreeenfunctions(),
      ),
    );
  }
}
