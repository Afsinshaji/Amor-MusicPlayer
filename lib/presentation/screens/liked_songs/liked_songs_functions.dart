import 'package:amor_musics/DB/functions/db_functions.dart';
import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/DB/model/likedsongsmodel.dart';
import 'package:amor_musics/bloc/liked/liked_bloc.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/NowplayingWidget/now_playiing_Screen_functions.dart';

import 'package:amor_musics/presentation/screens/current_playing_screen/current_playing.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../bloc/mostlyplayed/mostlyplayed_bloc.dart';
import '../../../bloc/nowplaying/nowplaying_bloc.dart';
import '../../../bloc/recentlyplayed/recentlyplayed_bloc.dart';
import '../../common_widgets&funs/add_to_likedsongs.dart';
import '../../common_widgets&funs/add_to_mostplayed.dart';
import '../../common_widgets&funs/add_to_recent.dart';

// ignore: must_be_immutable
class LikedSongsFunctions extends StatelessWidget {
  LikedSongsFunctions({
    super.key,
  });

  final List<LikedSongModel> favourite = [];

  final box = LikedSongBox.getInstance();

  late List<LikedSongModel> likedsongslist = box.values.toList();

  bool isalready = true;

  List<Audio> likedsong = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: likedSongsBuilder());
  }

  Widget likedSongsBuilder() {
    if (box.isEmpty) {
      return Center(
        child: Text(
          "Did you forget to like your favourite song?",
          style: TextStyle(
              color: otherTextColor, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      );
    }
    return BlocConsumer<LikedBloc, LikedState>(
      //  valueListenable: box.listenable(),
      buildWhen: (previous, current) => current is displayliked,
      listener: (context, state) {},
      builder: (context, likedState) {
        if (likedState is likedinitial) {
          context.read<LikedBloc>().add(const fetchLiked());
        }
        List<LikedSongModel> likedsongs = [];
        if (likedState is displayliked) {
          context.read<LikedBloc>().add(const fetchLiked());
          likedsongs = likedState.likedList;
        }
        likedsongs = likedsongs.reversed.toList();
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.builder(
              primary: false,
              itemCount: likedsongs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (1 / 1.28),
                  crossAxisCount: 2,
                  mainAxisSpacing: 0),
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Card(
                      elevation: 20,
                      shadowColor: baseTextColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: InkWell(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: QueryArtworkWidget(
                              artworkHeight: 145,
                              artworkWidth: 200,
                              // artworkFit: ,
                              id: likedsongs[index].id!,
                              type: ArtworkType.AUDIO,
                              nullArtworkWidget: ClipRRect(
                                  child: Image.asset(
                                'assets/images/images.jpg',
                                height: 150,
                              )),
                            )),
                        onTap: () {
                          List liking = LikedSongBox.getInstance()
                              .values
                              .toList()
                              .reversed
                              .toList();
                          //int val = liking.length - index - 1;
                          BlocProvider.of<RecentlyplayedBloc>(context)
                              .add(addToRecent(index, liking));
                          BlocProvider.of<MostlyplayedBloc>(context)
                              .add(addToMostly(index, liking));
                          CurrentPlayingFunction4.nowplayingindex.value = index;
                          CurrentPlayingFunction4.nowplayingBox.value = liking;
                          addToRecents(index, liking);
                          addToMostPlayed(index, liking);
                          BlocProvider.of<NowplayingBloc>(context).add(
                              playSong(songlist: liking, songindex: index));

                          // CurrentPlayingFunction4.pageIndex.value = 1;
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CurrentPlayingScreen(id: index),
                          ));
                        },
                      ),
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          likedsongs[index].title!,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(likedsongs[index].artist!,
                            overflow: TextOverflow.ellipsis),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            deletelikedsong(index, context);
                            // BlocProvider.of<LikedBloc>(context).add(
                            //     deleteLiked(context: context, index: index));
                            // context.read<LikedBloc>().add(
                            //     deleteLiked(context: context, index: index));
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 25,
                            color: Colors.white60,
                          )),
                    )
                  ],
                );
              })),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class LikeIcon extends StatefulWidget {
  LikeIcon({super.key, required this.index});

  int index;
  @override
  State<LikeIcon> createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  bool liked = false;
  List<LikedSongModel> likelist = [];
  final box = SongBox.getInstance();
  late List<AllSongModel> dbsongs;

  @override
  void initState() {
    dbsongs = box.values.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    likelist = likeddbsongs.values.toList();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [like()],
    );
  }

  Widget like() {
    if (likelist
        // ignore: unrelated_type_equality_checks
        .where((element) => element.id == dbsongs[widget.index].id.toString())
        .isEmpty) {
      return IconButton(
        onPressed: () {
          likeddbsongs.add(
            LikedSongModel(
              image: dbsongs[widget.index].id,
              artist: dbsongs[widget.index].artist,
              duration: dbsongs[widget.index].duration,
              title: dbsongs[widget.index].title,
              uri: dbsongs[widget.index].uri,
              id: dbsongs[widget.index].id,
            ),
          );

          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: baseTextColor,
              duration: const Duration(seconds: 1),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: Text(
                '${dbsongs[widget.index].title}Added to favourites',
              ),
            ),
          );
          //addfavfromdb();
          // print(dbSongs[widget.index].songname);
          // print(favdbsongs.values.toList());
        },
        icon: const Icon(
          Icons.favorite_border,
          color: Colors.white,
        ),
        splashRadius: 15,
      );
    } else {
      return IconButton(
        onPressed: () async {
          int currentIndex = likelist.indexWhere(
              (element) => element.title == dbsongs[widget.index].title);
          await likeddbsongs.deleteAt(currentIndex);
          // print(currentIndex);
          setState(() {});

          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: baseTextColor,
              duration: const Duration(seconds: 1),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: Text(
                  '${dbsongs[widget.index].title} Removed from favourites'),
            ),
          );
          // addfavfromdb();

          // print(widget.index);
        },
        icon: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        splashRadius: 15,
      );
    }
  }
}
