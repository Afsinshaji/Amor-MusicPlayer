import 'package:amor_musics/core/colors/color.dart';

import 'package:amor_musics/presentation/screens/home_screen/bottom_sheet.dart';
import 'package:amor_musics/presentation/screens/home_screen/drawer_functions.dart';
import 'package:amor_musics/presentation/screens/home_screen/homefunctions1.dart';
import 'package:amor_musics/presentation/screens/home_screen/homefunctions2.dart';
import 'package:amor_musics/presentation/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final upperTab = const TabBar(tabs: <Tab>[
    Tab(
      icon: Text(
        'All Songs',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
    Tab(
      icon: Text(
        'Library',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        bottomSheet: const BottomSheetMiniPlayer(),
        // bottomSheet: Miniplayer(
        //   minHeight: 10,
        //   maxHeight: 30,
        //   builder: (height, percentage) {
        //     return Center(
        //       child: Text('$height,$percentage'),
        //     );
        //   },
        // ),

        drawer: const Drawer(child: DrawerFunctions()),
        backgroundColor: basecolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: otherTextColor),
          toolbarHeight: 70,
          bottom: upperTab,
          // leading: Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.menu_rounded,
          //         size: 35,
          //         color: Colors.black,
          //       )),
          // ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  onPressed: () {},
                  icon: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SearchScreen())));
                    },
                    icon: Icon(
                      Icons.search,
                      size: 28,
                      color: otherTextColor,
                    ),
                  )),
            )
          ],
        ),
        body: const TabBarView(children: [HomeFunctions2(), HomeFunctions1()]),
      ),
    );
  }

  bottomSheet(BuildContext context) {
    return InkWell(
      onTap: (() {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: ((context) => CurrentPlayingScreen())));
      }),
      child: BottomSheet(
          onClosing: () {},
          builder: ((context) {
            return Container(
              color: baseTextColor,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Slider(
                    activeColor: basecolor,
                    inactiveColor: basecolor,
                    value: 0,
                    onChanged: (value) async {},
                    min: 0,
                    max: 1,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 0),
                          margin: const EdgeInsets.only(bottom: 6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/images.jpg',
                              height: 70,
                            ),
                          ),
                        ),
                        Text(
                          'O Saathi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: otherTextColor,
                          ),
                        ),
                        const SizedBox(),
                        const Icon(
                          Icons.skip_previous,
                          size: 35,
                          color: Colors.white,
                        ),
                        const Icon(
                          Icons.play_arrow,
                          size: 35,
                          color: Colors.white,
                        ),
                        const Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 35,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}
