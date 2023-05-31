import 'dart:developer';

import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/DB/model/playlistmodel.dart';

createplaylist(String name) async {
  final box = PlayListBox.getInstance();
  List<PlayListModel> playlistDB = box.values.toList();

  List<AllSongModel> songs = [];
  bool notAlready =
      playlistDB.where((element) => element.playlistTitle == name).isEmpty;
  if (notAlready) {
    log('hii');
    log(name);
    box.add(PlayListModel(playlistTitle: name, playlistSongs: songs));
  }
}

editPlaylist(String name, int index) {
  final box = PlayListBox.getInstance();
  List<PlayListModel> playlistDB = box.values.toList();
  if (playlistDB[index].playlistTitle != null) {
    playlistDB[index].playlistTitle = name;
  }
}

addToPlaylist(int index, List allSongDB, int songIndex) {
  log(songIndex.toString());

  //final allSongbox = SongBox.getInstance();
  final playbox = PlayListBox.getInstance();
  List<PlayListModel> playlistDB = playbox.values.toList();
  PlayListModel? playSongs = playbox.getAt(index);
  List<AllSongModel> playSongDB = playSongs!.playlistSongs!;
  // List<AllSongModel> allSongDB = allSongbox.values.toList();
  bool isAlreadyAdded =
      playSongDB.any((element) => element.id == allSongDB[songIndex].id);
  if (!isAlreadyAdded) {
    playSongDB.add(AllSongModel(
        id: allSongDB[songIndex].id,
        title: allSongDB[songIndex].title,
        artist: allSongDB[songIndex].artist,
        image: allSongDB[songIndex].image,
        uri: allSongDB[songIndex].uri,
        duration: allSongDB[songIndex].duration));
  }
  playbox.putAt(
      index,
      PlayListModel(
          playlistTitle: playlistDB[index].playlistTitle,
          playlistSongs: playSongDB));
}
