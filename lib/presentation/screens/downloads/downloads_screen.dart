import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/common_widgets&funs/datalist.dart';
import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Downloads',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: AllsongbuildMethods(),
      )),
    );
  }
}
