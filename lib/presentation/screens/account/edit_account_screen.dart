import 'package:amor_musics/presentation/screens/account/accountfunctions.dart';
import 'package:flutter/material.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bottomEditingsheet(context);
  }
}

bottomEditingsheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(child: accountProfileImage()),
            textFieldContainer()
          ],
        );
      });
}

textFieldContainer() {
  return Container(
    padding: const EdgeInsets.only(left: 20),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(15)),
    child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: Colors.white60,
          ),
          hintText: 'Enter Your Name',
        )),
  );
}
