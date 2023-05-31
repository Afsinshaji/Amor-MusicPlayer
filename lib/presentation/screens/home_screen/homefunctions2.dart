
import 'package:amor_musics/presentation/common_widgets&funs/datalist.dart';
import 'package:flutter/material.dart';


class HomeFunctions2 extends StatelessWidget {
  const HomeFunctions2({super.key});

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   List allList = SongBox.getInstance().values.toList();
    //   CurrentPlayingFunction4.listNotifier = allList;
    // });
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: AllsongbuildMethods(),
    ));
  }
}
