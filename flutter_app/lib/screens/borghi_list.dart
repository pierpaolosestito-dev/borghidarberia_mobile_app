import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/models/borgo.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'borgo_viewer.dart';

class BorghiList extends StatefulWidget {
  @override
  _BorghiList createState() => _BorghiList();
}

class _BorghiList extends State<BorghiList>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    if (selectedBorgo == -1) {
      return prx();
    } else {
      return WillPopScope(
        child: BorgoViewer(),
        onWillPop: () async {
          setState(() {
            selectedBorgo = -1;
          });
          return false;
        },
      );
    }
  }

  Widget prx() {
    return Container(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
          children:[
                         /*Card(

                    clipBehavior: Clip.antiAlias,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Container(

                        width: (MediaQuery.of(context).size.width) - 10,
                        decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Color.fromRGBO(160, 50, 41, 1),
                                  width: 10)),
                          color: Color.fromRGBO(250, 250, 252, 1),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 30,),
                                    Center(child:Image.asset("assets/images/hand.png",width: 100,height: 100,)),
                                    Padding(
                                      padding:const EdgeInsets.only(left:5),
                                      child:Text("Per le altre voci di menù o eventualmente per cambiare la lingua dell'audio-guida, premere su 'MENU' in alto a sinistra",style: TextStyle(fontWeight: FontWeight.bold),)
                                    ),
                                  SizedBox(height: 30,),

                                ])))),*/
              Expanded(
                child: ListView.builder(
                  itemCount: borghiList.length,
                  itemBuilder: (context, index) {

                    return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 16,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedBorgo = index;
                                  });
                                },
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: borghiList.values.toList()[index].imgBorgo,
                                                imageBuilder: (context, imageProvider) => Ink.image(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                  height: 200,

                                                ),
                                              placeholder: (context, url) => Container(
                                                height: 200,

                                                child: LinearProgressIndicator(),
                                                decoration: BoxDecoration(

                                                  borderRadius: BorderRadius.circular(20),

                                                ),
                                              ),
                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                            ),
                                            /*Ink.image(
                                              height: 200,
                                              image: NetworkImage(borghiList.values
                                                  .toList()[index]
                                                  .imgBorgo),
                                              fit: BoxFit.fill,
                                            ),*/
                                            Padding(
                                              padding: EdgeInsets.only(left: 7),
                                              child: Text(
                                                borghiList.values
                                                    .toList()[index]
                                                    .nome,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold),
                                              ), //FONT MAGGIORE
                                            ),
                                          ]),
                                      /*Padding(
                                        padding: EdgeInsets.only(top: 10, left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            FaIcon(FontAwesomeIcons.infoCircle),
                                            Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "Info",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),*/

                                      Padding(
                                        padding: EdgeInsets.only(top: 5, left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            FaIcon(FontAwesomeIcons.users),
                                            Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                borghiList.values
                                                    .toList()[index]
                                                    .numeroAbitanti,
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5, left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            FaIcon(FontAwesomeIcons.mountain),
                                            Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                borghiList.values
                                                    .toList()[index]
                                                    .altezza,
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      /*Padding(
                                        padding: const EdgeInsets.only(
                                            top: 17.0, left: 10.0, right: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Nome sindaco',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ), //FONT MAGGIORE
                                            ),
                                            Text(
                                              'Altezza e utili',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight
                                                      .w100), //FONT MAGGIORE
                                            ),
                                          ],
                                        ),
                                      ),*/
                                      SizedBox(
                                        height: 10,
                                      ),
                                      /*ButtonBar(
                                          buttonPadding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 10),
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Center(
                                              child: RaisedButton(
                                                child: Text("Visita"),
                                                textColor: Colors.white,
                                                color: Color.fromRGBO(160, 50, 41, 1),
                                                onPressed: () {
                                                  setState(() {
                                                    selectedBorgo = index;
                                                  });
                                                },
                                              ),
                                            ),
                                          ])*/
                                    ]))));
                  }),
              )]),

        ),

      ),
    );
  }
}
