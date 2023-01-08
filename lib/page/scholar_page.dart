import 'package:classroom_user/widget/reusables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resusable/utilies.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/scholar.dart';

class Scholarshippage extends StatefulWidget {
  static const routeName = '/ScholarPage';
  const Scholarshippage({super.key});

  @override
  State<Scholarshippage> createState() => _ScholarshippageState();
}

class _ScholarshippageState extends State<Scholarshippage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scholarships'),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: Scholar.scholar_list
                      .map((doc) => ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 15),
                            onTap: (() {}),
                            title: Text(
                              doc.title!,
                              style: GoogleFonts.nunito(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text('Apply before ${doc.date!}'),
                            trailing: ElevatedButton(
                              onPressed: () {
                                _launchURL(doc.url!);
                              },
                              child: new Text('Register'),
                            ),
                            leading: const Icon(
                              Icons.school_sharp,
                              color: Colors.red,
                              size: 28.0,
                            ),
                          ))
                      .toList(),
                )
              ]),
        ),
        drawer: drawer(context),
        bottomNavigationBar: bottomNavBar(context));
  }

  _launchURL(String link) async {
    // const url = link;
    // final uri = Uri.parse(url);

    await launchUrl(Uri.parse(link));
  }
}
