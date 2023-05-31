import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../DB/model/allsongmodel.dart';

part 'allsongs_event.dart';
part 'allsongs_state.dart';
part 'allsongs_bloc.freezed.dart';

class AllsongsBloc extends Bloc<AllsongsEvent, AllsongsState> {
  AllsongsBloc() : super(const Initial()) {
    on<fetchAllSongs>((event, emit) {
      List<AllSongModel> allSongList = SongBox.getInstance().values.toList();
      emit(displayAllSongs(allSongList: allSongList));
    });
  }
}
