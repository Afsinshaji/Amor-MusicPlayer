part of 'mostlyplayed_bloc.dart';

@freezed
class MostlyplayedState with _$MostlyplayedState {
  const factory MostlyplayedState.mostlyinitial() = mostlyinitial;
    const factory MostlyplayedState.displayMostly({required List<MostlyPlayedSongModel>mostlyList}) = displayMostly;
  
}
