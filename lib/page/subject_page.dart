import 'package:classroom_user/page/home_page.dart';
import 'package:classroom_user/page/reader_page.dart';
import 'package:classroom_user/widget/documentspage.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectPage extends StatefulWidget {
  static const routeName = '/SubjectPage';
  const SubjectPage({super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('English')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notes",
                  style: TextStyle(fontSize: 18),
                ),
                Column(
                  children: Document.doc_list
                      .map((doc) => ListTile(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => ReaderPage(doc))));
                            }),
                            title: Text(
                              doc.doc_title!,
                              style: GoogleFonts.nunito(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text("${doc.page_num!} Pages"),
                            trailing: Text(
                              doc.doc_date!,
                              style: GoogleFonts.nunito(color: Colors.grey),
                            ),
                            leading: Icon(
                              Icons.picture_as_pdf,
                              color: Colors.red,
                              size: 28.0,
                            ),
                          ))
                      .toList(),
                )
              ]),
        ),
      ),
    );
  }
}
