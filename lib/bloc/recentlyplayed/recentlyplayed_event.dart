part of 'recentlyplayed_bloc.dart';

@freezed
class RecentlyplayedEvent with _$RecentlyplayedEvent {
  const factory RecentlyplayedEvent.fetchRecent() = fetchRecent;
  const factory RecentlyplayedEvent.addToRecent(int index, List allsongs) = addToRecent;
  
}