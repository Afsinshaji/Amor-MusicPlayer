import 'package:hive/hive.dart';
part 'likedsongsmodel.g.dart';

@HiveType(typeId: 1)
class LikedSongModel {
  @HiveField(0)
  int? id;

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

  LikedSongModel(
      {this.id,
      required this.title,
      required this.artist,
      required this.image,
      required this.uri,
      required this.duration});
}

class LikedSongBox {
  static Box<LikedSongModel>? _box;
  static Box<LikedSongModel> getInstance() {
    return _box ??= Hive.box('likedsongs');
  }
}
