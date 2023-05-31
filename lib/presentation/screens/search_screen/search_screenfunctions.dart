import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/common_widgets&funs/datalist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../bloc/nowplaying/nowplaying_bloc.dart';
import '../NowplayingWidget/now_playiing_Screen_functions.dart';
import '../../common_widgets&funs/add_to_mostplayed.dart';
import '../../common_widgets&funs/add_to_recent.dart';
import '../current_playing_screen/current_playing.dart';

class SearchScreenFunctions extends StatefulWidget {
  const SearchScreenFunctions({super.key});

  @override
  State<SearchScreenFunctions> createState() => _SearchScreenFunctionsState();
}

class _SearchScreenFunctionsState extends State<SearchScreenFunctions> {
  final _searchController = TextEditingController();
  final box = SongBox.getInstance();
  List<AllSongModel> allSongList = Hive.box<AllSongModel>('').values.toList();
  late List<AllSongModel> displayList = List<AllSongModel>.from(allSongList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolor,
      appBar: searchBar(context),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          //buttonBar(),
          const SizedBox(
            height: 10,
          ),
          SearchallsongbuildMethod(),
        ],
      ))),
    );
  }

  searchBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: basecolor,
      titleSpacing: 0,
      toolbarHeight: 70,
      actions: const [
         SizedBox(
          width: 30,
        )
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Container(
        padding: const EdgeInsets.only(left: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 1),
            borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          controller: _searchController,
          autofocus: true,
          style: TextStyle(color: otherTextColor),
          decoration: InputDecoration(
            icon: Icon(
              Icons.search_rounded,
              color: otherTextColor,
            ),
            hintStyle: const TextStyle(
              color: Colors.white60,
            ),
            hintText: 'Search here',
          ),
          onChanged: ((value) {
            _searchSong(value);
          }),
        ),
      ),
    );
  }

  void _searchSong(String value) {
    setState(() {
      displayList = allSongList
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  buttonBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(baseTextColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                'Songs',
                style: TextStyle(color: otherTextColor),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(basecolor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      side: BorderSide(color: baseTextColor, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                'Artist',
                style: TextStyle(color: otherTextColor),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(basecolor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: BorderSide(color: baseTextColor, width: 2),
                    borderRadius: BorderRadius.circular(20)))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text('Playlist', style: TextStyle(color: otherTextColor)),
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SearchallsongbuildMethod() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.black12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              width: 193,
              child: ListTile(
                // leading: ClipRRect(
                //   child: Image.asset(images[index]),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: QueryArtworkWidget(
                    id: displayList[index].id!,
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: CircleAvatar(
                        child: Image.asset('assets/images/images.jpg')),
                  ),
                ),
                title: Text(
                  displayList[index].title!,
                  style: TextStyle(
                      color: otherTextColor,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis),
                ),
                subtitle: Text(
                  displayList[index].artist!,
                  style: TextStyle(
                      color: otherTextColor,
                      fontSize: 10,
                      overflow: TextOverflow.ellipsis),
                ),
                trailing: dropDownFunction(context, index, displayList),
                onTap: () {
                  FocusScope.of(context).unfocus();
                  CurrentPlayingFunction4.nowplayingindex.value = index;
                  CurrentPlayingFunction4.nowplayingBox.value = displayList;
                  addToRecents(index, displayList);
                  addToMostPlayed(index, displayList);
                     BlocProvider.of<NowplayingBloc>(context).add(
                              playSong(songlist: displayList, songindex: index));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CurrentPlayingScreen(id: index))));
                },
                // trailing: LikeButton(
                //   size: 5,
                // ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 0,
          );
        },
        itemCount: displayList.length);
  }
}
