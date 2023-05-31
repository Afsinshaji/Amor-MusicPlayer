import 'package:hive/hive.dart';
part 'recentlyplayed.g.dart';

@HiveType(typeId: 2)
class RecentlyPlayedSongModel {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? artist;

  @HiveField(3)
  final int? image;

  @HiveField(4)
  final String? uri;

  @HiveField(5)
  final int? duration;

  RecentlyPlayedSongModel(
      {required this.id,
      required this.title,
      required this.artist,
      required this.image,
      required this.uri,
      required this.duration});
}

class RecentSongBox {
  static Box<RecentlyPlayedSongModel>? _box;
  static Box<RecentlyPlayedSongModel> getInstance() {
    return _box ??= Hive.box('recentlyplayedsongs');
  }
}
