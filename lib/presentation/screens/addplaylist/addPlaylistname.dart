import 'package:amor_musics/bloc/playlist/playlist_bloc.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/myPlaylist/my_playlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../DB/model/playlistmodel.dart';

class AddPlaylistName extends StatelessWidget {
  AddPlaylistName({super.key});
  final _key = GlobalKey<FormState>();
  static ValueNotifier<int> editValue = ValueNotifier<int>(-1);
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
        backgroundColor: otherTextColor,
        body: SafeArea(
          child: Center(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Text(
                    'Give your Playlist a name',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        controller: textController,
                        style: const TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                        validator: ((text) {
                          if (text == null || text.isEmpty) {
                            return 'Text is empty';
                          }
                          List<PlayListModel> playlistname =
                              PlayListBox.getInstance().values.toList();
                          if (playlistname
                              .where((element) => element.playlistTitle == text)
                              .isNotEmpty) {
                            return 'Playlist Already Exits';
                          }
                          return null;
                        }),
                      )

                      // TextField(
                      //   style: TextStyle(fontSize: 30),
                      //   textAlign: TextAlign.center,
                      //   controller: textController,
                      // ),
                      ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0)]),
                margin: const EdgeInsets.symmetric(vertical: 50),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0)]),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      if (AddPlaylistName.editValue.value == -1) {
                        context.read<PlaylistBloc>().add(
                            createPlaylist(playlistname: textController.text));
                        // createplaylist(textController.text);
                      } else {
                        context.read<PlaylistBloc>().add(editplaylist(
                            playlistname: textController.text,
                            playlistindex: AddPlaylistName.editValue.value));

                        // editPlaylist(textController.text,
                        //     AddPlaylistName.editValue.value);
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const MyPlaylistScreen())));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Create',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
