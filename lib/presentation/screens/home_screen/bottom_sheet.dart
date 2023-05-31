import 'dart:developer';

import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/common_widgets&funs/add_to_recent.dart';
import 'package:amor_musics/presentation/screens/current_playing_screen/current_playing.dart';
//import 'package:amor_musics/screens/current_playing_screen/current_playing_functions.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import 'package:flutter/material.dart';

import 'package:on_audio_query/on_audio_query.dart';

import '../NowplayingWidget/now_playiing_Screen_functions.dart';

class BottomSheetMiniPlayer extends StatefulWidget {
  const BottomSheetMiniPlayer({super.key});
  static bool? boolnotifier = false;
  static ValueNotifier<bool> nowplayingbool =
      ValueNotifier<bool>(boolnotifier!);

  @override
  State<BottomSheetMiniPlayer> createState() => _BottomSheetMiniPlayerState();
}

class _BottomSheetMiniPlayerState extends State<BottomSheetMiniPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController iconController;
  bool isAnimated = true;
  //bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    log(BottomSheetMiniPlayer.nowplayingbool.value.toString());
    return ValueListenableBuilder(
        valueListenable: CurrentPlayingFunction4.nowplayingindex,
        builder: (context, index, child) {
          return ValueListenableBuilder(
              valueListenable: CurrentPlayingFunction4.nowplayingBox,
              builder: (context, value, child) {
                List allsongsdb = value;
                return BottomSheet(
                    onClosing: () {},
                    builder: ((context) {
                      return Container(
                        color: baseTextColor,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            progressBar(context),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  CurrentPlayingScreen(
                                                      id: index))));
                                    }),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 0),
                                          margin:
                                              const EdgeInsets.only(bottom: 6),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: QueryArtworkWidget(
                                                artworkHeight: 50,
                                                artworkWidth: 60,
                                                quality: 100,
                                                id: allsongsdb[index].id!,
                                                artworkQuality:
                                                    FilterQuality.high,
                                                type: ArtworkType.AUDIO,
                                                artworkBorder:
                                                    BorderRadius.circular(10),
                                                artworkFit: BoxFit.cover,
                                                nullArtworkWidget: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                    'assets/images/images.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: Text(
                                            allsongsdb[index].title!,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: otherTextColor),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(),
                                  Row(
                                    children: [
                                      PlayerBuilder.isPlaying(
                                        player: player,
                                        builder: (context, isPlaying) {
                                          return IconButton(
                                              onPressed: () async {
                                                previous(
                                                    player, index, allsongsdb);
                                                iconController.forward();
                                                isAnimated = true;
                                              },
                                              icon: const Icon(
                                                Icons.skip_previous,
                                                size: 25,
                                                color: Colors.white,
                                              ));
                                        },
                                      ),
                                      PlayerBuilder.isPlaying(
                                        player: player,
                                        builder: (context, isPlaying) {
                                          if (player.isPlaying.value) {
                                            iconController.forward();
                                          } else {
                                            iconController.reverse();
                                          }
                                          return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (isAnimated) {
                                                    iconController.reverse();
                                                    player.pause();
                                                    isAnimated = false;
                                                  } else {
                                                    iconController.forward();
                                                    player.play();
                                                    isAnimated = true;
                                                  }
                                                });
                                              },
                                              child: AnimatedIcon(
                                                  icon: AnimatedIcons
                                                      .play_pause,
                                                  progress: iconController,
                                                  size: 25,
                                                  color: Colors.white));
                                        },
                                      ),
                                      PlayerBuilder.isPlaying(
                                        player: player,
                                        builder: (context, isPlaying) {
                                          return IconButton(
                                            onPressed: () async {
                                              next(player, index, allsongsdb);
                                              iconController.forward();
                                              isAnimated = true;
                                            },
                                            icon: const Icon(
                                              Icons.skip_next,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }));
              });
        });
  }

  void playbutton(
      AssetsAudioPlayer assetsAudioPlayer, int index, List dbsongs) async {
    player.open(
      Audio.file(dbsongs[index].uri!),
      showNotification: true,
    );
    setState(() {
      CurrentPlayingFunction4.nowplayingindex.value;
    });
    await player.stop();
  }

  void previous(
      AssetsAudioPlayer assetsAudioPlayer, int index, List dbsongs) async {
//Exception...

    if (index == 0) {
      player.open(
        Audio.file(dbsongs[dbsongs.length - 1].uri!),
        showNotification: true,
      );
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
    addToRecents(index - 1, dbsongs);
    setState(() {
      CurrentPlayingFunction4.nowplayingindex.value--;
    });
    await player.stop();
  }

  void next(
      AssetsAudioPlayer assetsAudioPlayer, int index, List dbsongs) async {
    //Exception...

    if (index + 1 == dbsongs.length) {
      player.open(
        Audio.file(dbsongs[0].uri!),
        showNotification: true,
      );
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
    addToRecents(index + 1, dbsongs);
    setState(() {
      CurrentPlayingFunction4.nowplayingindex.value++;
    });
    await player.stop();
  }

  Widget progressBar(BuildContext context) {
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
                  thumbGlowColor: Colors.red,
                  thumbColor: Colors.red,
                  bufferedBarColor: Colors.red,
                  baseBarColor: Colors.red[50],
                  progressBarColor: basecolor,
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
}
