
import 'package:amor_musics/DB/functions/db_functions.dart';
import 'package:amor_musics/DB/model/mostlyPlayedSongModel.dart';

// List<MostPlayedSongModel> mostPlayed = [];

// updateMostCount(int index) {
//   final box = SongBox.getInstance();
//   List<AllSongModel> allSongs = box.values.toList();
//   log('here');
//   List<MostPlayedSongModel> mostPlayed = mostPlayedBox.values.toList();
//   log(mostPlayed.toString());
//   // if (mostPlayed
//   //     .where((element) => element.title == allSongs[index].title)
//   //     .isNotEmpty)
//   if (mostPlayed[index].title == allSongs[index].title) {
//     int i = mostPlayed[index].count!;
//     i = i + 1;
//     mostPlayed[index].count = i;
//     log('lokkjd');
//     log(mostPlayed[index].count.toString());
//   }
// }

addToMostPlayed(int index, List allSongs) {
//  log('Where the fuck are you...?');
  List<MostlyPlayedSongModel> mostlyPlayed = mostlyPlayedBox.values.toList();
  //log(mostlyPlayed.toString());

  // bool hello =
  //     mostlyPlayed.where((element) => element.id == allSongs[index].id).isEmpty;

 // log(hello.toString());
  if (mostlyPlayed
      .where((element) => element.id == allSongs[index].id)
      .isEmpty) {
    mostlyPlayedBox
        .add(MostlyPlayedSongModel(id: allSongs[index].id, count: 0));
   // log(mostlyPlayed.toString());
   // log(allSongs[index].id.toString());

    // log(mostlyPlayed[mostlyPlayed.length - 1].id.toString());
  } else {
    int listIndex =
        mostlyPlayed.indexWhere((element) => element.id == allSongs[index].id);
    int i = mostlyPlayed[listIndex].count!;
    i = i + 1;
    mostlyPlayed[listIndex].count = i;
  }
}

int getIndex() {
  List<MostlyPlayedSongModel> mostlyPlayed =
      MostlyPlayedBox.getInstance().values.toList();
  mostlyPlayed.sort(((a, b) => a.count!.compareTo(b.count!)));
  mostlyPlayed = mostlyPlayed.reversed.toList();

  return 1;
}
