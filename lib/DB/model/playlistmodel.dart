import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:hive/hive.dart';
part 'playlistmodel.g.dart';

@HiveType(typeId: 4)
class PlayListModel {
  @HiveField(0)
  String? playlistTitle;

  @HiveField(1)
  List<AllSongModel>? playlistSongs;
  PlayListModel({required this.playlistTitle, required this.playlistSongs});
}

class PlayListBox {
  static Box<PlayListModel>? _box;
  static Box<PlayListModel> getInstance() {
    return _box ??= Hive.box('playlistsongs');
  }
}
