// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:amor_musics/core/colors/color.dart';
import 'package:amor_musics/presentation/screens/account/account_screen.dart';
import 'package:amor_musics/presentation/screens/settings/privacy_policy/privacypolicy_screen.dart';
import 'package:amor_musics/presentation/screens/settings/terms&condition/terms_&_conditions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SetttingsFunctions extends StatelessWidget {
  SetttingsFunctions({super.key});
  var orientation, size, height, width;
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          accountListTile(context),
          const SizedBox(
            height: 40,
          ),
          settingsList(context)
        ],
      ),
    );
  }

  Widget accountListTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: accountImage(),
        title: const Text(
          'Account',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const AccountScreen())));
          },
        ),
      ),
    );
  }

  Widget accountImage() {
    return Stack(
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
              'assets/images/male-face-avatar-on-white-260nw-562359640.webp'),
        ),
        // Positioned(
        //     bottom: 10,
        //     right: 25,
        //     child: InkWell(
        //         child: const Icon(
        //           Icons.add_a_photo_outlined,
        //           size: 20,
        //         ),
        //         onTap: () {})),
      ],
    );
  }

  settingsList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0),
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const PrivacyPolicy())));
            },
            child: settingListBuilder(
                Icon(
                  Icons.key_sharp,
                  size: 40,
                  color: baseTextColor,
                ),
                'Privacy Policy'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const TermsAndConditions())));
            },
            child: settingListBuilder(
                Icon(
                  Icons.file_copy,
                  size: 35,
                  color: baseTextColor,
                ),
                'Terms & Conditions'),
          ),
          settingListBuilder(
              Icon(
                Icons.contact_mail,
                size: 35,
                color: baseTextColor,
              ),
              'Contact Us'),
          settingListBuilder(
              Icon(
                Icons.share,
                size: 35,
                color: baseTextColor,
              ),
              'Share Amor')
        ],
      ),
    );
  }

  Widget settingListBuilder(Icon icon, String title) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
