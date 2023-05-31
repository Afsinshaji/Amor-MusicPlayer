import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/account/accountfunctions.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
            Navigator.pop(context);
          },
        ),
      ),
      body: const AccountFunctions(),
      // floatingActionButton: Container(
      //   margin: EdgeInsets.all(40),
      //   child: FloatingActionButton(
      //     backgroundColor: baseTextColor,
      //     child: Icon(
      //       Icons.mode_edit_outline,
      //       size: 45,
      //     ),
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: ((context) => EditAccountScreen())));
      //     },
      //   ),
      // ),
    );
  }
}
