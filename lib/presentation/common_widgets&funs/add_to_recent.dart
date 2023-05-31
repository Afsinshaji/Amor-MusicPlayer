import 'package:amor_musics/DB/functions/db_functions.dart';
import 'package:amor_musics/DB/model/recentlyplayed.dart';

// final allsongbox = SongBox.getInstance();
// List<AllSongModel> allsongs = allsongbox.values.toList();
List<RecentlyPlayedSongModel> recentsongsdb = [];
addToRecents(int index, List allsongs) {
  recentsongsdb = recentlyPlayedBox.values.toList();
  if (recentsongsdb
      .where((element) => element.title == allsongs[index].title)
      .isEmpty) {
    recentlyPlayedBox.add(RecentlyPlayedSongModel(
        id: allsongs[index].id,
        title: allsongs[index].title,
        artist: allsongs[index].artist,
        image: allsongs[index].id,
        uri: allsongs[index].uri,
        duration: allsongs[index].duration));
  } else {
    int deleteindex = recentsongsdb
        .indexWhere((element) => element.title == allsongs[index].title);
    recentlyPlayedBox.deleteAt(deleteindex);
    recentlyPlayedBox.add(RecentlyPlayedSongModel(
        id: allsongs[index].id,
        title: allsongs[index].title,
        artist: allsongs[index].artist,
        image: allsongs[index].id,
        uri: allsongs[index].uri,
        duration: allsongs[index].duration));
  }
}
