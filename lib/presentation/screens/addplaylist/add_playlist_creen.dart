import 'package:amor_musics/DB/model/playlistmodel.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/addplaylist/add_playlist_functions.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddPlaylistScreen extends StatefulWidget {
  const AddPlaylistScreen({super.key});

  @override
  State<AddPlaylistScreen> createState() => _AddPlaylistScreenState();
}

class _AddPlaylistScreenState extends State<AddPlaylistScreen> {
  final box = PlayListBox.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolor,
      appBar: AddPlaylistBar(context),
      body: const AddPlaylistFunctionss(),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]),
        margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(baseTextColor)),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Create Playlist'),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  AddPlaylistBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: basecolor,
      titleSpacing: 0,
      toolbarHeight: 100,
      actions: const [
        SizedBox(
          width: 30,
        )
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, playDB, child) {
          List<PlayListModel> playList = playDB.values.toList();
          return Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            child: Text(playList[playList.length - 1].playlistTitle!),
          );
        },
      ),
    );
  }
}
