import 'package:classroom_user/page/donate_page.dart';

import 'package:classroom_user/page/profile.dart';
import 'package:classroom_user/page/request_page.dart';
import 'package:classroom_user/page/skill_enhancement_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../page/video_player.dart';

void displaySnackBar({required String text, BuildContext? context}) {
  ScaffoldMessenger.of(context!).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.white,
      margin: EdgeInsets.all(17),
      elevation: 6.0,
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        style: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.w600),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
  );
}

Widget loader(BuildContext context) {
  return const Center(
    child: CircularProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 4, 112, 220)),
    ),
  );
}

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              image: NetworkImage("https://vecteezy.com/free-png/book"),
              fit: BoxFit.contain,
            ),
          ),
          child: Container(),
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Colors.black,
          ),
          title: Text('Profile',
              style: GoogleFonts.roboto(
                  fontSize: 18, fontWeight: FontWeight.w600)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(Profile.routeName);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.request_page_outlined,
            color: Colors.black,
          ),
          title: Text('Request',
              style: GoogleFonts.roboto(
                  fontSize: 18, fontWeight: FontWeight.w600)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(RequestPage.routeName);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Colors.black,
          ),
          title: Text('Donate',
              style: GoogleFonts.roboto(
                  fontSize: 18, fontWeight: FontWeight.w600)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(DonatePage.routeName);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Colors.black,
          ),
          title: Text('Skills Enhancement',
              style: GoogleFonts.roboto(
                  fontSize: 18, fontWeight: FontWeight.w600)),
          onTap: () {
            Navigator.of(context).pop();
            // Navigator.of(context).pushNamed(SkillPage.routeName);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VideoPlayerScreen()));
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.28,
        ),
      ],
    ),
  );
}
