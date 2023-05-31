
import 'package:amor_musics/core/colors/color.dart';
import 'package:flutter/material.dart';

class AccountFunctions extends StatelessWidget {
  const AccountFunctions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [accountCard(), accountList()],
    );
  }

  Widget accountContainer() {
    return Container(
        height: 300,
        width: 600,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Boxing day deals.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            accountProfileImage(),
            const Text(
              'Accounth',
              style: TextStyle(fontSize: 22),
            )
          ],
        ));
  }

  Widget accountCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      height: 200,
      width: 300,
      child: Card(
        color: otherTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              accountProfileImage(),
              const Text(
                'Account',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  accountList() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 60),
        child: ListView(children: [
          ListTile(
              title: const Text(
                'Share Amor',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.share,
                color: baseTextColor,
                size: 40,
              )),
          ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.settings,
                color: baseTextColor,
                size: 40,
              ))
        ]),
      ),
    );
  }
}

Widget accountProfileImage() {
  return Stack(
    children: [
      const CircleAvatar(
        radius: 70,
        backgroundImage: AssetImage(
            'assets/images/male-face-avatar-on-white-260nw-562359640.webp'),
      ),
      Positioned(
          bottom: 10,
          right: 25,
          child: InkWell(
              child: const Icon(
                Icons.add_a_photo_outlined,
                size: 20,
              ),
              onTap: () {})),
    ],
  );
}
