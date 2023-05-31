part of 'nowplaying_bloc.dart';

@freezed
class NowplayingEvent with _$NowplayingEvent {
  const factory NowplayingEvent.playSong({required List songlist, required int songindex}) = playSong;
}