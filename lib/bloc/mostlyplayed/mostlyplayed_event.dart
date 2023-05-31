part of 'mostlyplayed_bloc.dart';

@freezed
class MostlyplayedEvent with _$MostlyplayedEvent {
  const factory MostlyplayedEvent.fetchMostly() = fetchMostly;
  const factory MostlyplayedEvent.addToMostly(int index, List mostsongs) =
      addToMostly;
}
