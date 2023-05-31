import 'package:amor_musics/DB/functions/db_functions.dart';
import 'package:amor_musics/DB/model/mostlyPlayedSongModel.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/common_widgets&funs/add_to_mostplayed.dart';

part 'mostlyplayed_event.dart';
part 'mostlyplayed_state.dart';
part 'mostlyplayed_bloc.freezed.dart';

class MostlyplayedBloc extends Bloc<MostlyplayedEvent, MostlyplayedState> {
  MostlyplayedBloc() : super(const mostlyinitial()) {
    on<fetchMostly>((event, emit) {
      List<MostlyPlayedSongModel> mostlyList = mostlyPlayedBox.values.toList();
      emit(displayMostly(mostlyList: mostlyList));
    });

    on<addToMostly>((event, emit) {
      addToMostPlayed(event.index, event.mostsongs);
      add(const fetchMostly());
    });
  }
}
