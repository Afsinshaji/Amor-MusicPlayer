part of 'nowplaying_bloc.dart';

@freezed
class NowplayingState with _$NowplayingState {
  const factory NowplayingState.initial() = nowplayinginitial;
  const factory NowplayingState.nowPlayingSong({required List songlist, required int songindex}) = nowPlayingSong;
}
