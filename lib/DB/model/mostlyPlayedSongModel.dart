import 'package:hive_flutter/hive_flutter.dart';
part 'mostlyPlayedSongModel.g.dart';

@HiveType(typeId: 5)
class MostlyPlayedSongModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int? count;
  MostlyPlayedSongModel({required this.id, required this.count});
}

class MostlyPlayedBox {
  static Box<MostlyPlayedSongModel>? _box;
  static Box<MostlyPlayedSongModel> getInstance() {
    return _box ??= Hive.box('MostlyPlayedBox');
  }
}
