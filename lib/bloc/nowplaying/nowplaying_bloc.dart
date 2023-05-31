import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nowplaying_event.dart';
part 'nowplaying_state.dart';
part 'nowplaying_bloc.freezed.dart';

class NowplayingBloc extends Bloc<NowplayingEvent, NowplayingState> {
  NowplayingBloc() : super(const nowplayinginitial()) {
    on<playSong>((event, emit) {
      emit(nowPlayingSong(songindex: event.songindex,songlist: event.songlist));
    });
  }
}
