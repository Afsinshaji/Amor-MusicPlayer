// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:amor_musics/DB/functions/db_functions.dart';
import 'package:amor_musics/DB/model/recentlyplayed.dart';
import 'package:amor_musics/bloc/recentlyplayed/recentlyplayed_bloc.dart';
import 'package:amor_musics/presentation/screens/NowplayingWidget/now_playiing_Screen_functions.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../bloc/mostlyplayed/mostlyplayed_bloc.dart';
import '../../../bloc/nowplaying/nowplaying_bloc.dart';
import '../../common_widgets&funs/datalist.dart';
import '../current_playing_screen/current_playing.dart';

// ignore: must_be_immutable
class RecentlyPlayedFunctions extends StatelessWidget {
  RecentlyPlayedFunctions({super.key});

  final box = RecentSongBox.getInstance();

  List<Audio> recentSongs = [];

  //final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer.withId('0');
  @override
  Widget build(BuildContext context) {
    if (recentlyPlayedBox.isEmpty) {
      return Center(
        child: Text(
          'Play Some Songs Dear...',
          style: TextStyle(
              color: otherTextColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }
    return BlocBuilder<RecentlyplayedBloc, RecentlyplayedState>(
      //valueListenable: recentlyPlayedBox.listenable(),

      builder: (context, recentState) {
        if (recentState is recentinitial) {
          context.read<RecentlyplayedBloc>().add(fetchRecent());
        }

        List<RecentlyPlayedSongModel> alldbSongs = [];

        if (recentState is displayRecent) {
          alldbSongs = recentState.recentList;
        }

        log('hello');
        if (alldbSongs.isEmpty) {
          log('Empty');
        }
        // return Text(alldbSongs.toString());

        return ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.black12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: QueryArtworkWidget(
                        id: alldbSongs[index].id!,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: CircleAvatar(
                            child: Image.asset('assets/images/images.jpg')),
                      ),
                    ),
                    title: Text(
                      alldbSongs[index].title!,
                      style: TextStyle(
                          color: otherTextColor,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis),
                    ),
                    subtitle: Text(
                      alldbSongs[index].artist!,
                      style: TextStyle(
                          color: otherTextColor,
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis),
                    ),
                    trailing: FittedBox(
                        child: Row(
                      children: [
                        const LikeButton(),
                        dropDownFunction(context, index, alldbSongs)
                      ],
                    )),
                    onTap: () {
                      // CurrentPlayingFunction.nowplayingindex.value = index;
                      // log('$index');

                      // log(alldbSongs[index].uri!);

                      // _audioPlayer.open(Audio.file(alldbSongs[index].uri!),
                      //     showNotification: true);

                      // addToRecents(index);

                      BlocProvider.of<RecentlyplayedBloc>(context)
                          .add(addToRecent(index, alldbSongs));
                      BlocProvider.of<MostlyplayedBloc>(context)
                          .add(addToMostly(index, alldbSongs));

                      CurrentPlayingFunction4.nowplayingBox.value = alldbSongs;
                      CurrentPlayingFunction4.nowplayingindex.value = index;
                      BlocProvider.of<NowplayingBloc>(context).add(
                          playSong(songlist: alldbSongs, songindex: index));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  CurrentPlayingScreen(id: index))));
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 0,
              );
            },
            itemCount: alldbSongs.length < 10 ? alldbSongs.length : 10);
      },
    );
  }
}

restore() {
  recentlyPlayedBox.clear();
}
