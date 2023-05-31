import 'package:amor_musics/DB/functions/db_functions.dart';
import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/DB/model/likedsongsmodel.dart';
import 'package:amor_musics/presentation/common_widgets&funs/datalist.dart';
import 'package:amor_musics/presentation/screens/liked_songs/liked_songs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../bloc/liked/liked_bloc.dart';

List<LikedSongModel> liked = [];

final box = SongBox.getInstance();
List<AllSongModel> dbSongs = box.values.toList();

addtoliked(BuildContext context, {required int index}) {
  liked = likeddbsongs.values.toList();

  if (liked.where((element) => element.title == dbSongs[index].title).isEmpty) {
    likeddbsongs.add(LikedSongModel(
        image: dbSongs[index].id,
        title: dbSongs[index].title,
        artist: dbSongs[index].artist,
        duration: dbSongs[index].duration,
        uri: dbSongs[index].uri,
        id: dbSongs[index].id));
    //setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(
          '${dbSongs[index].title}Added to Liked Songs',
        ),
      ),
    );
    //addfavfromdb();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(
          '${dbSongs[index].title} is already added to liked songs',
        ),
      ),
    );
  }
  // log(likeddbsongs.toString());
  //Afsin Shaji
}

removeliked(int index) async {
  final likebox = LikedSongBox.getInstance();
  // List<favourites> favouritessongs = [];
  List<LikedSongModel> favsongs = likebox.values.toList();
  List<AllSongModel> dbsongs = box.values.toList();
  int currentindex =
      favsongs.indexWhere((element) => element.id == dbsongs[index].id);
  await likeddbsongs.deleteAt(currentindex);
}

deletelikedsong(int index, BuildContext context) {
  alertforLikedBox(
      'Are You Sure?', context, likeddbsongs, likeddbsongs.length - index - 1);
  // await likeddbsongs.deleteAt(likeddbsongs.length - index - 1);
}

bool checkLikedStatus(int index, context) {
  List<LikedSongModel> likedsongs = [];
  List<AllSongModel> dbsongs = box.values.toList();
  LikedSongModel value = LikedSongModel(
      image: dbsongs[index].id,
      title: dbsongs[index].title,
      artist: dbsongs[index].artist,
      duration: dbsongs[index].duration,
      uri: dbsongs[index].uri,
      id: index);

  likedsongs = likeddbsongs.values.toList();
  bool isAlreadyThere =
      likedsongs.where((element) => element.title == value.title).isEmpty;
  return isAlreadyThere ? true : false;
}

alertforLikedBox(String instruction, BuildContext context, Box box, int index) {
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
                    BlocProvider.of<LikedBloc>(context)
                        .add(deleteLiked(context: context, index: index));
                    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const LikedSongsScreen() ,));
                    Navigator.of(context).pop();
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
