import 'package:hive/hive.dart';
part 'allsongmodel.g.dart';

@HiveType(typeId: 0)
class AllSongModel {
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

  AllSongModel(
      {required this.id,
      required this.title,
      required this.artist,
      required this.image,
      required this.uri,
      required this.duration});
}

class SongBox {
  static Box<AllSongModel>? _getbox;
  static Box<AllSongModel> getInstance() {
    return _getbox ??= Hive.box('');
  }
}
