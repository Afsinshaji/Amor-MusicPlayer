import 'dart:developer';
import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/bloc/allsongs/allsongs_bloc.dart';
import 'package:amor_musics/bloc/liked/liked_bloc.dart';
import 'package:amor_musics/bloc/mostlyplayed/mostlyplayed_bloc.dart';
import 'package:amor_musics/bloc/nowplaying/nowplaying_bloc.dart';
import 'package:amor_musics/bloc/recentlyplayed/recentlyplayed_bloc.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/NowplayingWidget/now_playiing_Screen_functions.dart';
import 'package:amor_musics/presentation/common_widgets&funs/add_to_likedsongs.dart';
import 'package:amor_musics/presentation/screens/current_playing_screen/current_playing.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:on_audio_query/on_audio_query.dart';

late List<SongModel> songList;

List songs = ['song1', 'song2', 'song3', 'song4', 'song5'];
List artist = ['artist1', 'artist2', 'artist3', 'artist4', 'artist5'];
List images = [
  'assets/images/images.jpg',
  'assets/images/channels4_profile.jpg',
  'assets/images/1583191585259.jpeg',
  'assets/images/decorative-waterfall-wallpaper-500x500.webp',
  'assets/images/square-sized-banner-publishing-social-network-multicolored-textured-paper-copy-space-square-sized-banner-publishing-154357256.jpg'
];

List playlist = ['Romantic Hits', 'Melody', 'Lofi', 'Malayalam', 'Hindi'];

class AllsongbuildMethods extends StatefulWidget {
  const AllsongbuildMethods({super.key});

  @override
  State<AllsongbuildMethods> createState() => _AllsongbuildMethodsState();
}

class _AllsongbuildMethodsState extends State<AllsongbuildMethods> {
  @override
  Widget build(BuildContext context) {
    return AllsongbuildMethod();
  }

  // ignore: non_constant_identifier_names
  Widget AllsongbuildMethod() {
    final box = SongBox.getInstance();
    List<Audio> allSongs = [];

    if (box.isEmpty) {
      return Center(
          child: Text(
        'Add Some Music Machoo, We can Play & Enjoy..',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: otherTextColor),
      ));
    } else {
      return BlocBuilder<AllsongsBloc, AllsongsState>(
        //  valueListenable: box.listenable(),
        builder: (context, allsongstate) {
          if (allsongstate is Initial) {
            context.read<AllsongsBloc>().add(const fetchAllSongs());
          }
          List<AllSongModel> alldbSongs = [];
          if (allsongstate is displayAllSongs) {
            alldbSongs = allsongstate.allSongList;
          }

          for (var item in alldbSongs) {
            allSongs.add(
              Audio.file(
                item.uri!,
                metas: Metas(
                  artist: item.artist,
                  title: item.title,
                  id: item.id.toString(),
                ),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      AllSongModel songs = alldbSongs[index];
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
                                id: songs.id!,
                                type: ArtworkType.AUDIO,
                                nullArtworkWidget: CircleAvatar(
                                    child: Image.asset(
                                        'assets/images/images.jpg')),
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
                                InkWell(
                                  child: LikeButton(
                                    isLiked: checkLikedStatus(index, context)
                                        ? false
                                        : true,
                                    onTap: (isLiked) {
                                      setState(() {
                                        isLiked = true;
                                      });
                                      return likedOrNot(context, index);
                                    },
                                  ),
                                ),
                                dropDownFunction(context, index, alldbSongs)
                              ],
                            )),
                            onTap: () {
                              List allList =
                                  SongBox.getInstance().values.toList();

                              CurrentPlayingFunction4.nowplayingindex.value =
                                  index;
                              CurrentPlayingFunction4.nowplayingBox.value =
                                  allList;

                              //   addToRecents(index, allList);
                              //  addToMostPlayed(index, allList);
                              BlocProvider.of<NowplayingBloc>(context).add(
                                  playSong(
                                      songlist: allList, songindex: index));

                              context
                                  .read<RecentlyplayedBloc>()
                                  .add(addToRecent(index, allList));
                              context
                                  .read<MostlyplayedBloc>()
                                  .add(addToMostly(index, allList));

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
                    itemCount: alldbSongs.length),
              ),
            ],
          );
        },
      );
    }
  }
}

Widget dropDownFunction(BuildContext context, int index, List list) {
  log('second$index');
  return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.black),
      child: PopupMenuButton(
        itemBuilder: ((context) => [
              PopupMenuItem(
                value: 1,
                child: InkWell(
                  child: Row(
                    children: const [
                      Icon(Icons.favorite),
                      Text('Add to Liked Songs')
                    ],
                  ),
                ),
                onTap: () {
                  if (checkLikedStatus(DropdownFunction.index, context)) {
                    addtoliked(context, index: DropdownFunction.index);
                    context.read<LikedBloc>().add(addOrdeleteLiked(
                        context: context, index: DropdownFunction.index));
                  } else if (!checkLikedStatus(
                      DropdownFunction.index, context)) {
                    removeliked(DropdownFunction.index);
                  }
                },
              ),
              PopupMenuItem(
                  value: 2,
                  child: InkWell(
                      child: Row(
                        children: const [
                          Icon(Icons.add),
                          Text('Add To Playlist')
                        ],
                      ),
                      onTap: () {
                        addToplayingList(context, list, index);
                      })),
              // PopupMenuItem(
              //     value: 3,
              //     child: InkWell(
              //       onTap: () {
              //         list.removeAt(index);
              //       },
              //       child: Row(
              //         children: [Icon(Icons.delete), Text('Delete Song')],
              //       ),
              //     )),
            ]),
        icon: Icon(
          Icons.more_vert,
          size: 28,
          color: otherTextColor,
        ),
        color: basecolor,
        elevation: 3,
        onSelected: ((value) {}),
      ));
}

class DropdownFunction extends StatefulWidget {
  const DropdownFunction({super.key});
  static int index = 0;

  @override
  State<DropdownFunction> createState() => _DropdownFunctionState();
}

class _DropdownFunctionState extends State<DropdownFunction> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: PopupMenuButton(
          itemBuilder: ((context) => [
                PopupMenuItem(
                  value: 1,
                  child: InkWell(
                    child: Row(
                      children: const [
                        Icon(Icons.favorite),
                        Text('Add to Liked Songs')
                      ],
                    ),
                  ),
                  onTap: () {
                    if (checkLikedStatus(DropdownFunction.index, context)) {
                      addtoliked(context, index: DropdownFunction.index);
                    } else if (!checkLikedStatus(
                        DropdownFunction.index, context)) {
                      removeliked(DropdownFunction.index);
                    }

                    // addLikedSongs(LikedSongModel(
                    //   title: , artist: artist, image: image, uri: uri, duration: duration))
                  },
                ),
                PopupMenuItem(
                    value: 2,
                    child: InkWell(
                      child: Row(
                        children: const [
                          Icon(Icons.add),
                          Text('Add To Playlist')
                        ],
                      ),
                    )),
                PopupMenuItem(
                    value: 3,
                    child: InkWell(
                      child: Row(
                        children: const [
                          Icon(Icons.delete),
                          Text('Delete Song')
                        ],
                      ),
                    )),
              ]),
          icon: Icon(
            Icons.more_vert,
            size: 28,
            color: otherTextColor,
          ),
          color: basecolor,
          elevation: 3,
          onSelected: ((value) {}),
        ));
  }
}

likedOrNot(BuildContext context, int index) {
  if (checkLikedStatus(index, context)) {
    addtoliked(context, index: index);
  } else if (!checkLikedStatus(index, context)) {
    removeliked(index);
  }
}

alertBox(String instruction, BuildContext context, List list, int index) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.red,
      content: Container(
        height: 100,
        color: Colors.red,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            instruction,
            style: const TextStyle(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.white)))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'cancel',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    list.removeAt(index);
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

alertforBox(String instruction, BuildContext context, Box box, int index) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.red,
      content: Container(
        height: 100,
        color: Colors.red,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            instruction,
            style: const TextStyle(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'cancel',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    box.deleteAt(index);
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
