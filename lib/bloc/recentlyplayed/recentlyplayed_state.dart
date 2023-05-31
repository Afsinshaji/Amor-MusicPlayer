part of 'recentlyplayed_bloc.dart';

@freezed
abstract class RecentlyplayedState with _$RecentlyplayedState {
  const factory RecentlyplayedState.recentinitial() = recentinitial;
  const factory RecentlyplayedState.displayRecent(
      {required List<RecentlyPlayedSongModel> recentList}) = displayRecent;
}
  