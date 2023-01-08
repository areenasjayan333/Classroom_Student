import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resusable/utilies.dart';
import '../widget/placementpage.dart';
import '../widget/reusables.dart';

class Placementpage extends StatefulWidget {
  static const routeName = '/PlacementPage';
  const Placementpage({super.key});

  @override
  State<Placementpage> createState() => _PlacementpageState();
}

class _PlacementpageState extends State<Placementpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Placements")),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: Placement.placement_list
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
                              Icons.work,
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
