part of 'allsongs_bloc.dart';

@freezed
class AllsongsEvent with _$AllsongsEvent {
  const factory AllsongsEvent.fetchAllSongs() = fetchAllSongs;
}