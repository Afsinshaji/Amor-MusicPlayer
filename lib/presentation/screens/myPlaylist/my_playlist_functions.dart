import 'dart:developer';

import 'package:amor_musics/DB/model/playlistmodel.dart';
import 'package:amor_musics/bloc/playlist/playlist_bloc.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/addplaylist/addPlaylistname.dart';
import 'package:amor_musics/presentation/screens/myPlaylist/each_playlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class MyPlaylistFunction extends StatelessWidget {
  MyPlaylistFunction({super.key});

  List<PlayListModel> playList = [];

  final box = PlayListBox.getInstance();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: playlistFunctions());
  }

  // playlistFunctions() {
  Widget playlistFunctions() {
    if (box.isEmpty) {
      return Center(
        child: Text(
          'Make Your Own Playlist,Enjoy...',
          style: TextStyle(
              color: otherTextColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      // valueListenable: box.listenable(),
      builder: (context, playlistState) {
        // if (playlistState is playlistnitial) {
        context.read<PlaylistBloc>().add(const fetchplaylist());
        // }

        if (playlistState is displayplaylist) {
          playList = playlistState.playlist;
        }
        // playList = playlistDB.values.toList();

        return Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(8),
          child: ListView.separated(
            itemBuilder: ((context, index) {
              return Card(
                  color: otherTextColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: Text(
                        playList[index].playlistTitle!,
                        style: TextStyle(
                            fontSize: 20,
                            color: baseTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    onTap: () {
                      EachPlayListScreen.currentplaylistindex.value = index;

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EachPlayListScreen(),
                      ));
                    },
                    leading: IconButton(
                        onPressed: () {
                          AddPlaylistName.editValue.value = index;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => AddPlaylistName())));
                        },
                        icon: Icon(
                          Icons.edit,
                          color: basecolor,
                        )),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: basecolor,
                      ),
                      onPressed: () {
                        alertforplaylistBox(
                            'Are You Sure', context, box, index);
                      },
                    ),
                    // leading: Padding(
                    //   padding: const EdgeInsets.all(2.0),
                    //   child: ClipRRect(
                    //     child: Image.asset(images[index]),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    // ),
                  ));
            }),
            itemCount: playList.length,
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: 10,
              );
            }),
          ),
        );
      },
    );
  }

  alertforplaylistBox(
      String instruction, BuildContext context, Box box, int index) {
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
                                    side: const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {
                          log('oiiiiiiiii');
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
                          log('oiiiiiiiii');
                          // context
                          //     .read<PlaylistBloc>()
                          //     .add(deleteplaylist(playlistindex: index));
                          BlocProvider.of<PlaylistBloc>(context)
                              .add(deleteplaylist(playlistindex: index));
                          Navigator.pop(context);
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
