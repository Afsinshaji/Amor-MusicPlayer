// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:amor_musics/DB/functions/db_functions.dart';
import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/bloc/mostlyplayed/mostlyplayed_bloc.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../DB/model/mostlyPlayedSongModel.dart';
import '../../../bloc/nowplaying/nowplaying_bloc.dart';
import '../../../bloc/recentlyplayed/recentlyplayed_bloc.dart';
import '../NowplayingWidget/now_playiing_Screen_functions.dart';
import '../current_playing_screen/current_playing.dart';

class MostPlayedFunctions extends StatelessWidget {
  const MostPlayedFunctions({super.key});

  @override
  Widget build(BuildContext context) {
    if (mostlyPlayedBox.values
        .toList()
        .where((element) => element.count! > 3)
        .isEmpty) {
      return Center(
        child: Text(
          'Play More And Come back...:)',
          style: TextStyle(
              color: otherTextColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }

    return BlocBuilder<MostlyplayedBloc, MostlyplayedState>(
      // valueListenable: mostlyPlayedBox.listenable(),
      builder: (context, mostlyState) {
        //List<MostPlayedSongModel> mostdbSongs = mostsongBox.values.toList();

        if (mostlyState is mostlyinitial) {
          context.read<MostlyplayedBloc>().add(const fetchMostly());
        }
        List<MostlyPlayedSongModel> mostPlayed = [];
        if (mostlyState is displayMostly) {
          mostPlayed = mostlyState.mostlyList;
        }

        List<AllSongModel> mostdbSongs = SongBox.getInstance().values.toList();
        // mostlyPlayed = mostlyPlayedBox.values.toList();
        List mostlyPlayed = List.from(mostPlayed);
        mostlyPlayed.sort(((a, b) => a.count!.compareTo(b.count!)));
        mostlyPlayed = mostlyPlayed.reversed.toList();
        log('oiiiiiii');

        return ListView.separated(
            itemBuilder: (context, index) {
              // if (mostdbSongs[index].count! >= 5) {
              if (mostlyPlayed[index].count! >= 3) {
                int newIndex = mostdbSongs.indexWhere(
                    (element) => element.id == mostlyPlayed[index].id);
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
                          id: mostdbSongs[newIndex].image!,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: CircleAvatar(
                              child: Image.asset('assets/images/images.jpg')),
                        ),
                      ),
                      title: Text(
                        mostdbSongs[newIndex].title!,
                        style: TextStyle(
                            color: otherTextColor,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis),
                      ),
                      subtitle: Text(
                        mostdbSongs[newIndex].artist!,
                        style: TextStyle(
                            color: otherTextColor,
                            fontSize: 10,
                            overflow: TextOverflow.ellipsis),
                      ),
                      trailing: FittedBox(
                          child: Column(
                        children: [
                          Card(
                            color: baseTextColor,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                mostlyPlayed[index].count.toString(),
                                style: TextStyle(
                                    color: otherTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          Text(
                            'Times Played',
                            style: TextStyle(
                                color: otherTextColor,
                                fontWeight: FontWeight.bold),
                          )
                          // const LikeButton(),
                          // dropDownFunction(context, index)
                        ],
                      )),
                      onTap: () {
                        // CurrentPlayingFunction.nowplayingindex.value = index;
                        // log('$index');

                        // log(alldbSongs[index].uri!);

                        // _audioPlayer.open(Audio.file(alldbSongs[index].uri!),
                        //     showNotification: true);

                        // addToRecents(index);

                        //Following code Have been Is useful But changed the fature of Mostly played;

                        // List mostlyList;

                        //........................................
                        //.......................................
                        // addToRecents(newIndex, mostdbSongs);
                        // addToMostPlayed(newIndex, mostdbSongs);
                        

                        BlocProvider.of<RecentlyplayedBloc>(context)
                            .add(addToRecent(newIndex, mostdbSongs));
                        BlocProvider.of<MostlyplayedBloc>(context)
                            .add(addToMostly(newIndex, mostdbSongs));

                        CurrentPlayingFunction4.nowplayingindex.value =
                            newIndex;
                        CurrentPlayingFunction4.nowplayingBox.value =
                            mostdbSongs;
                             BlocProvider.of<NowplayingBloc>(context).add(
                              playSong(songlist: mostdbSongs, songindex: newIndex));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    CurrentPlayingScreen(id: index))));
                      },
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 0,
              );
            },
            itemCount: mostlyPlayed.length < 10 ? mostlyPlayed.length : 10);
      },
    );
  }
}

//final mostbox = MostPlayedBox.getInstance();

List<Audio> mostSongs = [];
