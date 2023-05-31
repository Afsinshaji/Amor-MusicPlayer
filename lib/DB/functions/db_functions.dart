import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/DB/model/likedsongsmodel.dart';
import 'package:amor_musics/DB/model/playlistmodel.dart';
import 'package:amor_musics/DB/model/recentlyplayed.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/mostlyPlayedSongModel.dart';

// ValueNotifier<List<AllSongModel>> allSongsListNotifier = ValueNotifier([]);

// Future<void> addallSongs(AllSongModel value) async {
//   final allSongsDB = await Hive.openBox<AllSongModel>('allsongs_db');
//   allSongsDB.add(value);
//   allSongsListNotifier.value.add(value);
//   allSongsListNotifier.notifyListeners();
// }

// Future<void> getAllsongs() async {
//   final allSongsDB = await Hive.openBox<AllSongModel>('allsongs_db');
//   allSongsListNotifier.value.clear();

//   allSongsListNotifier.value.addAll(allSongsDB.values);
//   allSongsListNotifier.notifyListeners();
// }

// ValueNotifier<List<LikedSongModel>> likedsongsListNotifier = ValueNotifier([]);
// Future<void> addLikedSongs(LikedSongModel value) async {
//   final likedsongsDB = await Hive.openBox<LikedSongModel>('likedsongs_db');
//   likedsongsDB.add(value);
//   likedsongsListNotifier.value.add(value);
//   likedsongsListNotifier.notifyListeners();
// }

late Box<AllSongModel> allSongsDB;
openallSongdb() async {
  allSongsDB = await Hive.openBox<AllSongModel>('allSongs');
}

late Box<LikedSongModel> likeddbsongs;
openlikeddb() async {
  likeddbsongs = await Hive.openBox<LikedSongModel>('likedsongs');
}

late Box<RecentlyPlayedSongModel> recentlyPlayedBox;
openrecentlyplayeddb() async {
  recentlyPlayedBox = await Hive.openBox("recentlyplayed");
}

// late Box<MostPlayedSongModel> mostPlayedBox;
// openmostplayeddb() async {
//   mostPlayedBox = await Hive.openBox('mostplayedbox');
// }

late Box<PlayListModel> playlistBox;
openplaylistdb() async {
  playlistBox = await Hive.openBox('playlistbox');
}

late Box<MostlyPlayedSongModel> mostlyPlayedBox;
openmostlyplayeddb() async {
  mostlyPlayedBox = await Hive.openBox('mostlyplayedbox');
}
