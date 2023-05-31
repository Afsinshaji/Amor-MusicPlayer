// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:developer';

import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/DB/model/likedsongsmodel.dart';
import 'package:amor_musics/DB/model/mostlyPlayedSongModel.dart';
import 'package:amor_musics/DB/model/recentlyplayed.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/liked_songs/liked_songs_screen.dart';
import 'package:amor_musics/presentation/screens/mostplayed/most_played_screen.dart';
import 'package:amor_musics/presentation/screens/recentlyplayed/recently_played_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../bloc/liked/liked_bloc.dart';
import '../../../bloc/mostlyplayed/mostlyplayed_bloc.dart';
import '../../../bloc/recentlyplayed/recentlyplayed_bloc.dart';
import '../NowplayingWidget/now_playiing_Screen_functions.dart';
import '../../common_widgets&funs/add_to_mostplayed.dart';
import '../../common_widgets&funs/add_to_recent.dart';
import '../current_playing_screen/current_playing.dart';
import '../../../bloc/nowplaying/nowplaying_bloc.dart';
// import 'package:miniplayer/miniplayer.dart';

class HomeFunctions1 extends StatelessWidget {
  const HomeFunctions1({super.key});

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            listHeading(
                'Recently Played', context, const RecentlyPlayedScreen()),
            BlocBuilder<RecentlyplayedBloc, RecentlyplayedState>(
              // valueListenable: recentlyPlayedBox.listenable(),
              builder: (context, recentState) {
                if (recentState is recentinitial) {
                  context.read<RecentlyplayedBloc>().add(const fetchRecent());
                }
                List<RecentlyPlayedSongModel> recentList = [];
                if (recentState is displayRecent) {
                  recentList = recentState.recentList;
                }

                //  recentList =
                //     recentlyPlayedBox.values.toList().reversed.toList();
                // .take(10)
                // .toList();

                if (recentList.isEmpty) {
                  return Card(
                      margin: const EdgeInsets.only(left: 30),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          '''Play Some, 
            Like Some,
                           Enjoy...''',
                          style: TextStyle(
                              color: otherTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ));
                }

                return songlist(recentList);
              },
            ),
            listHeading('Most Played', context, const MostPlayedScreen()),
            BlocBuilder<MostlyplayedBloc, MostlyplayedState>(
              // valueListenable: MostlyPlayedBox.getInstance().listenable(),
              builder: (context, mostState) {
                if (mostState is mostlyinitial) {
                  context.read<MostlyplayedBloc>().add(const fetchMostly());
                }
                List<AllSongModel> newList = [];
                List<AllSongModel> allSongs =
                    SongBox.getInstance().values.toList();

                List<MostlyPlayedSongModel> mostList = [];
                if (mostState is displayMostly) {
                  mostList = List.from(mostState.mostlyList);
                }
                //List<MostlyPlayedSongModel> mostList = mosttBox.values.toList();
                mostList.sort(((a, b) => a.count!.compareTo(b.count!)));
                mostList = mostList.reversed.take(10).toList();
                for (var i = 0; i < mostList.length; i++) {
                  if (mostList[i].count! > 3) {
                    int ind = allSongs
                        .indexWhere((element) => element.id == mostList[i].id);
                    newList.add(allSongs[ind]);
                  }
                }
                if (mostList.where((element) => element.count! > 3).isEmpty) {
                  return Card(
                      margin: const EdgeInsets.only(left: 30),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          '''Play Some, 
            Like Some,
                           Enjoy...''',
                          style: TextStyle(
                              color: otherTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ));
                }

                return songlist(newList);
              },
            ),
            listHeading('Liked Songs', context, const LikedSongsScreen()),
            BlocBuilder<LikedBloc, LikedState>(
              //  valueListenable: LikedSongBox.getInstance().listenable(),
              builder: (context, likedState) {
                if (likedState is likedinitial) {
                  context.read<LikedBloc>().add(const fetchLiked());
                }
                List<LikedSongModel> likedList = [];
                if (likedState is displayliked) {
                  context.read<LikedBloc>().add(const fetchLiked());
                  likedList = likedState.likedList;
                }

                // List<LikedSongModel> likedList = recentBox.values.toList();
                if (likedList.isEmpty) {
                  return Card(
                      margin: const EdgeInsets.only(left: 30),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          '''Play Some, 
            Like Some,
                           Enjoy...''',
                          style: TextStyle(
                              color: otherTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ));
                }
                return songlist(likedList);
              },
            ),
            const SizedBox(
              height: 110,
            )

            // songlist(),
            // Text('Liked Songs'),
            // songlist(),
            // Text('Downloads'),
            // songlist(),
          ],
        ),
      ),
    );
  }

  listHeading(String head, BuildContext context, Widget Page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Page)));
        },
        child: Text(
          head,
          style: TextStyle(
              fontSize: 20, color: otherTextColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget songlist(List songs) {
    log(songs.length.toString());
    return SizedBox(
      height: height / 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: ListView.separated(
          padding: const EdgeInsets.only(left: 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return card(index, songs,context);
          }),
          itemCount: songs.length,
          separatorBuilder: ((context, index) {
            return const Divider();
          }),
        ),
      ),
    );
  }

  card(int index, List songs,BuildContext context) {
    log(songs[index].id.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      child: InkWell(
        onTap: () {
          CurrentPlayingFunction4.nowplayingBox.value = songs;
          CurrentPlayingFunction4.nowplayingindex.value = index;
          // addToRecents(index, songs);
          // addToMostPlayed(index, songs);
            BlocProvider.of<RecentlyplayedBloc>(context)
                          .add(addToRecent(index, songs));
                      BlocProvider.of<MostlyplayedBloc>(context)
                          .add(addToMostly(index, songs));
                             BlocProvider.of<NowplayingBloc>(context).add(
                          playSong(songlist: songs, songindex: index));

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => CurrentPlayingScreen(id: index))));
        },
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: QueryArtworkWidget(
                    artworkWidth: 150,
                    artworkHeight: 150,
                    id: songs[index].id!,
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/images.jpg',
                        height: 150,
                        width: 150,
                      ),
                    ),
                  )

                  // Image.asset(
                  //   songs[index].id,
                  //   fit: BoxFit.fill,
                  //   width: 150,
                  //   height: 150,
                  // ),
                  ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  songs[index].title!,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
              ),
              Text(
                songs[index].artist!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var orientation, size, height, width;
