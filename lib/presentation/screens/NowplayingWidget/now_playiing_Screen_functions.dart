// ignore_for_file: prefer_const_constructors

import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/DB/model/likedsongsmodel.dart';
import 'package:amor_musics/DB/model/playlistmodel.dart';
import 'package:amor_musics/bloc/nowplaying/nowplaying_bloc.dart';
import 'package:amor_musics/bloc/playlist/playlist_bloc.dart';
import 'package:amor_musics/presentation/common_widgets&funs/add_to_recent.dart';
import 'package:amor_musics/presentation/screens/home_screen/bottom_sheet.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../common_widgets&funs/add_to_likedsongs.dart';
import '../../common_widgets&funs/datalist.dart';

// ignore: must_be_immutable
class CurrentPlayingFunction4 extends StatefulWidget {
  CurrentPlayingFunction4({super.key, required this.id});

  int id;
  List<LikedSongModel> liked = [];
  //static ValueNotifier<int> pageIndex = ValueNotifier<int>(0);
  static List listNotifier = SongBox.getInstance().values.toList();
  static ValueNotifier<List> nowplayingBox = ValueNotifier<List>(listNotifier);
  static int? indexnotifier = 0;
  static ValueNotifier<int> nowplayingindex =
      ValueNotifier<int>(indexnotifier!);
  @override
  State<CurrentPlayingFunction4> createState() =>
      _CurrentPlayingFunction4State();
}

AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');
List<Audio> allsong = [];
late List<AllSongModel> songs;

class _CurrentPlayingFunction4State extends State<CurrentPlayingFunction4>
    with SingleTickerProviderStateMixin {
  _CurrentPlayingFunction4State();

  late AnimationController iconController;
  bool isAnimated = true;
  //bool isPlay = false;
  bool willPlay = true;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  List<Audio> convertaudio = [];

  @override
  void initState() {
    super.initState();

    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    if (!player.isPlaying.value) {
      player.open(
        Audio.file(CurrentPlayingFunction4.nowplayingBox
            .value[CurrentPlayingFunction4.nowplayingindex.value].uri!),
        showNotification: true,
        headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
      );
    }
    iconController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // return ValueListenableBuilder(
    //   valueListenable: CurrentPlayingFunction4.nowplayingindex,
    //   builder: (context, value1, child) {
    //     return ValueListenableBuilder(
    //         valueListenable: CurrentPlayingFunction4.nowplayingBox,

    return BlocConsumer<NowplayingBloc, NowplayingState>(
        listener: (context, state) {},
        buildWhen: (previous, current) => current is nowPlayingSong,
        builder: ((context, allsongState) {
          List<dynamic> allDbsongs = [];
          int value1 = 0;
          if (allsongState is nowPlayingSong) {
            allDbsongs = allsongState.songlist;
            value1 = allsongState.songindex;
          }
          // List<dynamic> allDbsongs = allsongbox;

          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                currentSongUi(context, allDbsongs, value1),
                progressBar(context),
                playButtons(allDbsongs, value1),
                additionalButtonBar(value1)
              ],
            ),
          );
          //   },
          // );
        }));
    //   },
    // );
  }

  currentSongUi(BuildContext context, List<dynamic> allDbsongs, int value1) {
    // return audioPlayer.builderCurrent(builder: (context, playing) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QueryArtworkWidget(
            artworkHeight: 200,
            artworkWidth: 200,
            quality: 100,
            id: allDbsongs[value1].id!,
            artworkQuality: FilterQuality.high,
            type: ArtworkType.AUDIO,
            artworkBorder: BorderRadius.circular(10),
            artworkFit: BoxFit.cover,
            nullArtworkWidget: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'assets/images/images.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            allDbsongs[value1].title!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            allDbsongs[value1].artist!,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
    // }

    // );
  }

  progressBar(BuildContext context) {
    return SizedBox(
      height: 30,
      child: player.builderCurrent(builder: (context, isplaying) {
        return PlayerBuilder.realtimePlayingInfos(
            player: player,
            builder: (context, realtimePlayingInfos) {
              final duration = realtimePlayingInfos.current!.audio.duration;
              final position = realtimePlayingInfos.currentPosition;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ProgressBar(
                  thumbGlowColor: Colors.black,
                  thumbColor: Colors.black,
                  bufferedBarColor: Colors.black,
                  baseBarColor: Colors.black12,
                  progressBarColor: Colors.black,
                  progress: position,
                  total: duration,
                  onSeek: (duration) async {
                    await player.seek(duration);
                  },
                ),
              );
            });
      }),
    );
  }

  playButtons(List<dynamic> allDbsongs, int value1) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.only(right: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.only(top: 25),
              margin: const EdgeInsets.only(left: 0),
              child: IconButton(
                  onPressed: () {
                    player.seekBy(const Duration(seconds: -10));
                  },
                  icon: const Icon(
                    Icons.replay_10,
                    size: 30,
                  )),
            ),
            PlayerBuilder.isPlaying(
              player: player,
              builder: (context, isPlaying) {
                return IconButton(
                    onPressed: () async {
                      previous(player, value1, allDbsongs);
                      iconController.forward();
                      isAnimated = true;
                      BottomSheetMiniPlayer.nowplayingbool.value = true;
                    },
                    icon: const Icon(Icons.skip_previous, size: 60));
              },
            )
          ]),
          PlayerBuilder.isPlaying(
            player: player,
            builder: (context, isPlaying) {
              return Container(
                margin: const EdgeInsets.only(left: 35),
                padding: const EdgeInsets.only(top: 28),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isAnimated) {
                          iconController.reverse();
                          player.pause();
                          isAnimated = false;
                          BottomSheetMiniPlayer.nowplayingbool.value = false;
                        } else {
                          iconController.forward();
                          player.play();
                          isAnimated = true;
                          BottomSheetMiniPlayer.nowplayingbool.value = true;
                        }
                      });
                    },
                    child: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: iconController,
                        size: 70,
                        color: Colors.black)),
              );
            },
          ),
          Row(children: [
            PlayerBuilder.isPlaying(
              player: player,
              builder: (context, isPlaying) {
                return IconButton(
                  onPressed: () async {
                    next(player, value1, allDbsongs);

                    iconController.forward();
                    isAnimated = true;
                    BottomSheetMiniPlayer.nowplayingbool.value = true;
                  },
                  icon: const Icon(
                    Icons.skip_next,
                    size: 60,
                  ),
                );
              },
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              padding: const EdgeInsets.only(top: 25),
              margin: const EdgeInsets.only(right: 0),
              child: IconButton(
                  onPressed: () {
                    player.seekBy(const Duration(seconds: 10));
                  },
                  icon: const Icon(
                    Icons.forward_10,
                    size: 30,
                  )),
            )
          ])
        ],
      ),
    );
  }

  additionalButtonBar(int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        margin: const EdgeInsets.only(top: 30),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: LikeButton(
                isLiked: checkLikedStatus(index, context) ? false : true,
                onTap: (isLiked) {
                  setState(() {
                    isLiked = true;
                  });
                  return likedOrNot(context, index);
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  // ignore: void_checks
                  return addToplayingList(
                      context,
                      CurrentPlayingFunction4.nowplayingBox.value,
                      CurrentPlayingFunction4.nowplayingindex.value);
                },
                icon: const Icon(
                  Icons.add_box,
                  size: 35,
                  color: Colors.white54,
                )),
            IconButton(
                onPressed: () {
                  CurrentPlayingFunction4.nowplayingBox.value.shuffle();
                  final snackBar = SnackBar(
                    content: Text('Your Songs are now Shuffled...'),
                    action: SnackBarAction(
                      label: ' ',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(
                  Icons.shuffle,
                  size: 35,
                  color: Colors.white54,
                )),
            // IconButton(
            //     onPressed: () {},
            //     icon: const Icon(
            //       Icons.file_download,
            //       size: 35,
            //       color: Colors.white54,
            //     ))
          ],
        ),
      ),
    );
  }

  // void playbutton(AssetsAudioPlayer assetsAudioPlayer, int index,
  //     List<dynamic> dbsongs) async {
  //   // player.open(
  //   //   Audio.file(dbsongs[index].uri!),
  //   //   showNotification: true,
  //   // );
  //   //addToRecents(index - 1);
  //   // setState(() {
  //   //   CurrentPlayingFunction4.nowplayingindex.value;
  //   // });
  //   await player.stop();
  // }

  void previous(AssetsAudioPlayer assetsAudioPlayer, int index,
      List<dynamic> dbsongs) async {
    //Exception...

    if (index == 0) {
      player.open(
        Audio.file(dbsongs[dbsongs.length - 1].uri!),
        showNotification: true,
      );
      BlocProvider.of<NowplayingBloc>(context)
          .add(playSong(songlist: dbsongs, songindex: dbsongs.length - 1));
      setState(() {
        CurrentPlayingFunction4.nowplayingindex.value = dbsongs.length - 1;
      });
      return;
    }

    //.......

    player.open(
      Audio.file(dbsongs[index - 1].uri!),
      showNotification: true,
    );
    BlocProvider.of<NowplayingBloc>(context)
        .add(playSong(songlist: dbsongs, songindex: index - 1));
    addToRecents(index - 1, dbsongs);
    setState(() {
      CurrentPlayingFunction4.nowplayingindex.value--;
    });
    await player.stop();
  }

  void next(AssetsAudioPlayer assetsAudioPlayer, int index,
      List<dynamic> dbsongs) async {
    //Exception...

    if (index + 1 == dbsongs.length) {
      player.open(
        Audio.file(dbsongs[0].uri!),
        showNotification: true,
      );
      BlocProvider.of<NowplayingBloc>(context)
          .add(playSong(songlist: dbsongs, songindex: 0));
      setState(() {
        CurrentPlayingFunction4.nowplayingindex.value = 0;
      });
      return;
    }

    //.......

    player.open(
      Audio.file(dbsongs[index + 1].uri!),
      showNotification: true,
    );
    BlocProvider.of<NowplayingBloc>(context)
        .add(playSong(songlist: dbsongs, songindex: index + 1));

    addToRecents(index + 1, dbsongs);
    setState(() {
      CurrentPlayingFunction4.nowplayingindex.value++;
    });

    await player.stop();
  }
}

addToplayingList(BuildContext context, List list, int songIndex) {
  return showDialog(
    context: context,
    builder: (context) =>
        // AlertDialog(
        //   content:

        Column(
      children: [
        const SizedBox(height: 400),
        Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Playlist',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.black),
            height: double.infinity,
            width: double.infinity,
            //color: Colors.black,
            child: BlocBuilder<PlaylistBloc, PlaylistState>(
                //valueListenable: PlayListBox.getInstance().listenable(),
                builder: (context, playlistState) {
              if (playlistState is playlistnitial) {
                context.read<PlaylistBloc>().add(const fetchplaylist());
              }
              List<PlayListModel> playList = [];
              if (playlistState is displayplaylist) {
                playList = playlistState.playlist;
              }

              return playList.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            context.read<PlaylistBloc>().add(addplaylistsongs(
                                playlistindex: index,
                                songsList: list,
                                songindex: songIndex));

                            Navigator.of(context).pop();

                            final snackBar = SnackBar(
                              content: Text(
                                  '${list[songIndex].title} is added to ${playList[index].playlistTitle!}'),
                              action: SnackBarAction(
                                label: ' ',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            //addToPlaylist(index, list, songIndex);
                          },
                          child: Text(
                            playList[index].playlistTitle!,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      },
                      itemCount: playList.length)
                  : const Center(
                      child: Text('Create a new Playlist mahn...'),
                    );
            }),
          ),
        ),
      ],
    ),
    // ),
  );
}
