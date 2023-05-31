part of 'playlist_bloc.dart';

@freezed
class PlaylistState with _$PlaylistState {
  const factory PlaylistState.initial() = playlistnitial;
  const factory PlaylistState.displayplaylist({required List<PlayListModel> playlist}) = displayplaylist;
  const factory PlaylistState.displayeachplaylist({required List<AllSongModel> playlist}) = displayeachplaylist;
}
