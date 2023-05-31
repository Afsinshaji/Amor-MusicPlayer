import 'dart:developer';

import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/DB/model/playlistmodel.dart';
import 'package:amor_musics/bloc/playlist/playlist_bloc.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/NowplayingWidget/now_playiing_Screen_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:amor_musics/bloc/recentlyplayed/recentlyplayed_bloc.dart';
import '../../../bloc/mostlyplayed/mostlyplayed_bloc.dart';
import '../../../bloc/nowplaying/nowplaying_bloc.dart';

import '../../common_widgets&funs/add_to_mostplayed.dart';
import '../../common_widgets&funs/add_to_recent.dart';
import '../current_playing_screen/current_playing.dart';
import 'my_playlist_screen.dart';

class EachPlayListScreen extends StatefulWidget {
  const EachPlayListScreen({super.key});
  static int? indexnotifier = 0;
  static ValueNotifier<int> currentplaylistindex =
      ValueNotifier<int>(indexnotifier!);

  @override
  State<EachPlayListScreen> createState() => _EachPlayListScreenState();
}

class _EachPlayListScreenState extends State<EachPlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolor,
      appBar: AppBar(
        leading:  IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: otherTextColor,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const MyPlaylistScreen())));
          },
        ),
          backgroundColor: Colors.transparent,
          title: ValueListenableBuilder(
            valueListenable: PlayListBox.getInstance().listenable(),
            builder: (context, playBox, child) {
              List<PlayListModel> list = playBox.values.toList();
              return Text(
                  list[EachPlayListScreen.currentplaylistindex.value]
                      .playlistTitle!,
                  style: const TextStyle(color: Colors.white));
            },
          )),
      body: SafeArea(
          child: eachPlaylistFun(
              context, EachPlayListScreen.currentplaylistindex.value)),
    );
  }

  Widget eachPlaylistFun(BuildContext context, int playlistIndex) {
    log(playlistIndex.toString());
    List<PlayListModel> playlistLists =
        PlayListBox.getInstance().values.toList();
    List<AllSongModel> eachPlayLists =
        playlistLists[playlistIndex].playlistSongs!;

    // context
    //     .read<PlaylistBloc>()
    //     .add(fetchplaylistsongs(playlistindex: playlistIndex));

    if (eachPlayLists.isEmpty) {
      return Center(
        child: Text(
          'Add Some Songs Dear...',
          style: TextStyle(
              color: otherTextColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      //  valueListenable: PlayListBox.getInstance().listenable(),
      builder: (context, playlistState) {
        List<AllSongModel> eachPlayList = [];
        if (playlistState is displayplaylist) {
          log('hiiii216');
          eachPlayList = playlistState.playlist[playlistIndex].playlistSongs!;
        }

        log('hiiii');
        log(eachPlayList.length.toString());
        return ListView.separated(
            itemCount: eachPlayList.length,
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
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
                        id: eachPlayList[index].image!,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: CircleAvatar(
                            child: Image.asset('assets/images/images.jpg')),
                      ),
                    ),
                    title: Text(
                      eachPlayList[index].title!,
                      style: TextStyle(
                          color: otherTextColor,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis),
                    ),
                    subtitle: Text(
                      eachPlayList[index].artist!,
                      style: TextStyle(
                          color: otherTextColor,
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis),
                    ),
                    trailing: FittedBox(
                        child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: basecolor,
                          ),
                          onPressed: () {
                            playlistSongalertBox(
                                'Are You sure', context, playlistIndex, index);
                          },
                        ),
                      ],
                    )),
                    onTap: () {
                      // addToRecents(index, eachPlayList);
                      // addToMostPlayed(index, eachPlayList);
                      BlocProvider.of<RecentlyplayedBloc>(context)
                          .add(addToRecent(index, eachPlayList));
                      BlocProvider.of<MostlyplayedBloc>(context)
                          .add(addToMostly(index, eachPlayList));
                      CurrentPlayingFunction4.nowplayingBox.value =
                          eachPlayList;
                      CurrentPlayingFunction4.nowplayingindex.value = index;
                       BlocProvider.of<NowplayingBloc>(context).add(
                          playSong(songlist: eachPlayList, songindex: index));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  CurrentPlayingScreen(id: index))));
                    },
                  ),
                ),
              );
            });
      },
    );
  }

  playlistSongalertBox(String instruction, BuildContext context,
      int playlistindex, int songindex) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.red,
        content: Container(
          height: 100,
          color: Colors.red,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  instruction,
                  style: const TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Colors.white)))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'cancel',
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    side: const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {
                          BlocProvider.of<PlaylistBloc>(context).add(
                              deleteplaylistsongs(
                                  playlistindex: playlistindex,
                                  songindex: songindex));

                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const EachPlayListScreen(),
                          ));
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
