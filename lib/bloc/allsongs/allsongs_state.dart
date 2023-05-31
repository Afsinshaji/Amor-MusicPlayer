part of 'allsongs_bloc.dart';

@freezed
class AllsongsState with _$AllsongsState {
  const factory AllsongsState.initial() = Initial;
   const factory AllsongsState.displayAllSongs(
      {required List<AllSongModel> allSongList}) = displayAllSongs;

}

