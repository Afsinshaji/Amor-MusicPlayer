import 'package:amor_musics/DB/model/allsongmodel.dart';
import 'package:amor_musics/core/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AddPlaylistFunctionss extends StatefulWidget {
  const AddPlaylistFunctionss({super.key});

  @override
  State<AddPlaylistFunctionss> createState() => _AddPlaylistFunctionssState();
}

class _AddPlaylistFunctionssState extends State<AddPlaylistFunctionss> {
  final box = SongBox.getInstance();
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return AddPlaylistallsongbuildMethod();
  }

  // ignore: non_constant_identifier_names
  Widget AddPlaylistallsongbuildMethod() {
    return ValueListenableBuilder<Box<AllSongModel>>(
      valueListenable: box.listenable(),
      builder: (context, allsongBox, child) {
        List<AllSongModel> alldbSongs = allsongBox.values.toList();

        if (alldbSongs.isEmpty) {}
        // return Text(alldbSongs.toString());

        return ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.black12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: QueryArtworkWidget(
                        id: alldbSongs[index].image!,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: CircleAvatar(
                            child: Image.asset('assets/images/images.jpg')),
                      ),
                    ),
                    title: Text(
                      alldbSongs[index].title!,
                      style: TextStyle(
                          color: otherTextColor,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis),
                    ),
                    subtitle: Text(
                      alldbSongs[index].artist!,
                      style: TextStyle(
                          color: otherTextColor,
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          // addToPlaylist(index);
                          setState(() {
                            isAdded = true;
                          });
                        },
                        icon: (isAdded)
                            ? Icon(
                                Icons.add,
                                size: 35,
                                color: baseTextColor,
                              )
                            : Icon(
                                Icons.check,
                                size: 35,
                                color: baseTextColor,
                              )),
                    onTap: () {},
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 0,
              );
            },
            itemCount: alldbSongs.length);
      },
    );

    // return ListView.separated(
    //     shrinkWrap: true,
    //     physics: NeverScrollableScrollPhysics(),
    //     itemBuilder: (context, index) {
    //       return Card(
    //         color: Colors.black12,
    //         shape:
    //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //         child: ListTile(
    //           leading: ClipRRect(
    //             child: Image.asset(images[index]),
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //           title: Row(
    //             children: [
    //               Text(
    //                 songs[index],
    //                 style: TextStyle(color: Colors.white, fontSize: 20),
    //               ),
    //               SizedBox(
    //                 width: 130,
    //               ),
    //               IconButton(
    //                   onPressed: () {},
    //                   icon: Icon(
    //                     Icons.add,
    //                     size: 35,
    //                     color: Colors.black,
    //                   ))
    //             ],
    //           ),
    //           subtitle: Text(
    //             artist[index],
    //             style: TextStyle(color: Colors.white, fontSize: 10),
    //           ),
    //           // trailing: LikeButton(
    //           //   size: 10,
    //           // ),
    //         ),
    //       );
    //     },
    //     separatorBuilder: (context, index) {
    //       return SizedBox(
    //         height: 0,
    //       );
    //     },
    //     itemCount: songs.length);
  }
}
