import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/common_widgets&funs/datalist.dart';
import 'package:flutter/material.dart';

class AllSongsScreen extends StatelessWidget {
  const AllSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('All Songs'),
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: AllsongbuildMethods(),
      )),
    );
  }
}
