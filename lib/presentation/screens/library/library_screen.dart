import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/home_screen/homescreen.dart';
import 'package:amor_musics/presentation/screens/library/library_screen_functions.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: otherTextColor,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const HomeScreen())));
          },
        ),
        toolbarHeight: 100,
        title: Row(
          children: [
            Icon(
              Icons.book,
              size: 40,
              color: otherTextColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Library',
              style: TextStyle(fontSize: 35, color: otherTextColor),
            )
          ],
        ),
      ),
      body: const LibraryFunctions(),
    );
  }
}
