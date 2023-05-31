import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/mostplayed/mostplayedfunctions.dart';
import 'package:flutter/material.dart';

class MostPlayedScreen extends StatelessWidget {
  const MostPlayedScreen({super.key});

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
        title: const Text('Most Played', style: TextStyle(color: Colors.white)),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 50),
            child: const Icon(
              Icons.query_stats,
              size: 50,
            ),
          )
        ],
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: MostPlayedFunctions(),
      )),
    );
  }
}
