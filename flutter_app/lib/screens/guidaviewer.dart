import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class GuidaViewer extends StatefulWidget {
  //final zoomDrawerController;
  @override
  State<StatefulWidget> createState() => _GuidaViewerState();
}

class _GuidaViewerState extends State<GuidaViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final String URL_PDF =
      "https://www.borghidarberia.it/wp-content/themes/neve-child/gallery-borghi/Guida-Borghi-d'Arberia.pdf";

  /*void _requestDownload() async {
      final taskId = await FlutterDownloader.enqueue(
        url: URL_PDF,
        savedDir:  ,
        showNotification: true, // show download progress in status bar (for Android)
        openFileFromNotification: true, // click on notification to open downloaded file (for Android)
      );
    }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SfPdfViewer.asset(
          "assets/pdf/Guida-Borghi-d'Arberia.pdf",
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromRGBO(160, 50, 41, 1),
          child: const Icon(Icons.add)),*/
    );
  }
}
