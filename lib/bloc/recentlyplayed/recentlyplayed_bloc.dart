import 'package:amor_musics/DB/functions/db_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../DB/model/recentlyplayed.dart';
import '../../presentation/common_widgets&funs/add_to_recent.dart';

part 'recentlyplayed_event.dart';
part 'recentlyplayed_state.dart';
part 'recentlyplayed_bloc.freezed.dart';

class RecentlyplayedBloc
    extends Bloc<RecentlyplayedEvent, RecentlyplayedState> {
  RecentlyplayedBloc() : super(const recentinitial()) {
    on<fetchRecent>((event, emit) {
      List<RecentlyPlayedSongModel> recentList =
          recentlyPlayedBox.values.toList().reversed.toList();
      emit(displayRecent(recentList: recentList));
    });
    on<addToRecent>((event, emit) {
      addToRecents(event.index, event.allsongs);
      add(const fetchRecent());
    });
  }
}
