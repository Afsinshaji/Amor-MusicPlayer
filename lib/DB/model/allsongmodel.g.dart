// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allsongmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllSongModelAdapter extends TypeAdapter<AllSongModel> {
  @override
  final int typeId = 0;

  @override
  AllSongModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllSongModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      artist: fields[2] as String?,
      image: fields[3] as int?,
      uri: fields[4] as String?,
      duration: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AllSongModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.uri)
      ..writeByte(5)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllSongModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
