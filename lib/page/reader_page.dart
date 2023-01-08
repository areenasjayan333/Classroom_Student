import 'package:classroom_user/widget/documentspage.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReaderPage extends StatefulWidget {
  ReaderPage(this.doc, {Key? key}) : super(key: key);
  Document doc;

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SfPdfViewer.network(widget.doc.doc_url!),
      ),
    );
  }
}
