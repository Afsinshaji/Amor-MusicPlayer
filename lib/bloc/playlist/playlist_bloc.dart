import 'package:amor_musics/DB/model/playlistmodel.dart';
import 'package:amor_musics/presentation/common_widgets&funs/add_playlist.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../DB/model/allsongmodel.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';
part 'playlist_bloc.freezed.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc() : super(const playlistnitial()) {
    on<fetchplaylist>((event, emit) {
      List<PlayListModel> playlist = PlayListBox.getInstance().values.toList();
      emit(displayplaylist(playlist: playlist));
    });
    // on<fetchplaylistsongs>((event, emit) {
    //   List<PlayListModel> playlist = PlayListBox.getInstance().values.toList();
    //   emit(displayeachplaylist(
    //       playlist: playlist[event.playlistindex].playlistSongs!));
    // });
    on<createPlaylist>((event, emit) {
      createplaylist(event.playlistname);
      add(const fetchplaylist());
    });
    on<deleteplaylist>((event, emit) {
      // List<PlayListModel> playlist = PlayListBox.getInstance().values.toList();
      PlayListBox.getInstance().deleteAt(event.playlistindex);
      add(const fetchplaylist());
    });
    on<editplaylist>((event, emit) {
      editPlaylist(event.playlistname, event.playlistindex);
      add(const fetchplaylist());
    });
    on<addplaylistsongs>((event, emit) {
      addToPlaylist(event.playlistindex, event.songsList, event.songindex);
      // add(fetchplaylistsongs(playlistindex: event.playlistindex));
    });

    on<deleteplaylistsongs>((event, emit) {
      List<PlayListModel> playlist = PlayListBox.getInstance().values.toList();
      List<AllSongModel> playSongs =
          playlist[event.playlistindex].playlistSongs!;
      playSongs.removeAt(event.songindex);
      add(const fetchplaylist());
    });
  }
}
