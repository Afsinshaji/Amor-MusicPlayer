part of 'playlist_bloc.dart';

@freezed
class PlaylistEvent with _$PlaylistEvent {
  const factory PlaylistEvent.fetchplaylist() = fetchplaylist;
  // const factory PlaylistEvent.fetchplaylistsongs({required int playlistindex}) = fetchplaylistsongs;
  const factory PlaylistEvent.createPlaylist({required String playlistname}) = createPlaylist;
  const factory PlaylistEvent.deleteplaylist({required int playlistindex}) = deleteplaylist;
  const factory PlaylistEvent.editplaylist({required String playlistname,required int playlistindex}) = editplaylist;
  const factory PlaylistEvent.addplaylistsongs({required int playlistindex,required List songsList, required int songindex}) = addplaylistsongs;
  const factory PlaylistEvent.deleteplaylistsongs({required int playlistindex, required int songindex}) = deleteplaylistsongs;

}
