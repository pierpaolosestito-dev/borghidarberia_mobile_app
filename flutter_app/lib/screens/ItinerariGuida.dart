import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ItinerariGuida extends StatefulWidget {
  final String url;
  const ItinerariGuida(
      {Key? key, required this.url})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _ItinerariGuidaState();
}

class _ItinerariGuidaState extends State<ItinerariGuida> {
  final GlobalKey webViewKey = GlobalKey();
  bool _offstage = true;
  bool isLoading = true;
  String url = "";
  Future<void> _printHello()async {
    await Future.delayed(Duration(milliseconds:150));
    setState(() {
    url=widget.url;
      _offstage = false;
      isLoading = false;
      print("ORa si vede");
    });
  }
  @override
  void didUpdateWidget(ItinerariGuida oldWidget) {
    if (oldWidget.url != widget.url) {
      setState(() {

      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  Stack(
          children: <Widget>[
            Offstage(
              offstage: _offstage,
              child: InAppWebView(
                key: webViewKey,
                onLoadStop: (controller, url) async {
                  if (url == Uri.parse(widget.url)) {


                    var _one = await controller.evaluateJavascript(
                        source:
                        'document.getElementsByClassName("grecaptcha-badge")[0].remove()');
                    var _two = await controller.evaluateJavascript(source:
                    'document.getElementById("wp-block-themeisle-blocks-advanced-columns-15a8e74d").remove();');

                    var _three = await controller.evaluateJavascript(
                        source: 'document.querySelector("#site-footer").remove();');
                    var _four = await controller.evaluateJavascript(
                        source:
                        'document.getElementsByClassName("header")[0].remove();');




                    _printHello();
                  }
                },
                initialUrlRequest:
                URLRequest(url: Uri.parse(widget.url)),


              ),

            ),
            isLoading? Scaffold(
                backgroundColor: Color.fromRGBO(230, 230, 230, 1),
                body: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center, //Center Column contents vertically,
                  crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Column contents horizontally,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Caricamento news in corso',
                            style: new TextStyle(
                                fontSize: 25.0,
                                color: Color.fromRGBO(163, 52, 51, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.all(12)),
                          Image(image: AssetImage('assets/images/prova_launch.PNG')),
                          Padding(
                            padding: EdgeInsets.only(bottom: 25),
                          ),
                          Center(
                            child: Text(
                              "Potrebbe volerci " + "\n" + "qualche secondo",
                              textAlign: TextAlign.center,
                              style: new TextStyle(

                                  fontSize: 25.0,
                                  color: Color.fromRGBO(163, 52, 51, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height:25),
                          /*Text(
                    "Caricamento informazioni",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(163, 52, 51, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),*/
                          CircularProgressIndicator(
                            strokeWidth: 5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(163, 52, 51, 1)),
                          ),
                        ],
                      ),
                    )
                  ],
                )):Stack(),],
        ),
      ),
    );
  }
}