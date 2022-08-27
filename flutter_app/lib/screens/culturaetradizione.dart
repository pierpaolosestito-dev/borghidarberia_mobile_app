import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/widget/PlayGuideButton.dart';

import '../globals.dart';
import 'cultura_tradizione/EparchiaLungro.dart';
import 'cultura_tradizione/LaGjitonia.dart';
import 'cultura_tradizione/TiNarroUnaStoria.dart';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

List<String> images = [
  "https://www.borghidarberia.it/wp-content/uploads/2021/09/eparchia-di-lungro.jpg",
  "https://www.borghidarberia.it/wp-content/uploads/2021/09/la-gjitonia.jpg",
  "https://www.borghidarberia.it/wp-content/uploads/2021/09/Ti-Narro-una-Storia.jpg",
];

List<String> title = [
  "",
  "La Gjitonia",
  "Ti narro una storia",
];

class CustomIcons {
  static const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
  static const IconData option = IconData(0xe902, fontFamily: "CustomIcons");
}

class Itinerari extends StatefulWidget {
  @override
  _ItinerariState createState() => _ItinerariState();
}

class _ItinerariState extends State<Itinerari> {
  var currentPage = images.length - 1.0;
  var toDisplay = -1;

  void rebuildRequested(int toUpdate) {
    if (toDisplay != -1) {
      if (toUpdate == -1) {
        toDisplay = -1;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    if (toDisplay == 0) {
      return EParchiaLungro(rebuild: rebuildRequested);
    } else if (toDisplay == 1) {
      return LaGjiotona(rebuild: rebuildRequested);
    } else if (toDisplay == 2) {
      return TiNarroUnaStoria(
        rebuild: rebuildRequested,
      );
    } else {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(230, 230, 230, 1),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        "CULTURA E TRADIZIONE",
                        style: TextStyle(
                            fontFamily: "Calibre-Semibold",
                            color:  Color.fromRGBO(160, 50, 41, 1),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0),
                      ),
                     /* IconButton(
                        icon: Icon(Icons.more, size: 30, color: Colors.white),
                        onPressed: () {},
                      ),*/
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    CardScrollWidget(currentPage),
                    Positioned.fill(
                      child: PageView.builder(
                        itemCount: images.length,
                        controller: controller,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container();
                        },
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.page == 0.0) {
                      toDisplay = 0;
                    } else if (controller.page == 1.0) {
                      toDisplay = 1;
                    } else if (controller.page == 2.0) {
                      toDisplay = 2;
                    }
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(160, 50, 41, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  child: Text('Voglio saperne di più'),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: FadeInUp(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    /**/

                        child: Card(
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
                                  color: Colors.grey.shade300,
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[

                                          Divider(
                                            thickness: 0,
                                          ),
                                          Text(
                                              "Gli Arbëreshë sono considerati a tutti gli effetti un “miracolo” sociale (Pasolini për arbëreshët: “Një mrekulli antropologjike”). Anche dopo cinque secoli lontano dalla Madrepatria continuano a mantenere viva la lingua albanese, nonché il rito bizantino, le tradizioni ed gli usi, mostrandosi del tutto cittadini italiani, ma di stirpe e provenienza etnica diversa. Tra i tanti aspetti delle tradizioni albanesi d’Italia una è la sua trasmissione legata quasi esclusivamente alla forma orale, nonostante sia cospicua la quantità e la documentazione della lingua e della cultura. Un importante aspetto che si evince della cultura e delle tradizioni delle comunità arbëreshë è il profondo rispetto che attribuiscono all’ospite: secondo cui la casa dell’albanese è di Dio e dell’ospite, al quale si fa onore offrendogli semplici cibarie.",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                              )),

                                          Divider(
                                            thickness: 0,
                                          ),
                                          PlayGuideButton(
                                            textToPlay:
                                            "Gli Arbëreshë sono considerati a tutti gli effetti un “miracolo” sociale (Pasolini për arbëreshët: “Një mrekulli antropologjike”). Anche dopo cinque secoli lontano dalla Madrepatria continuano a mantenere viva la lingua albanese, nonché il rito bizantino, le tradizioni ed gli usi, mostrandosi del tutto cittadini italiani, ma di stirpe e provenienza etnica diversa. Tra i tanti aspetti delle tradizioni albanesi d’Italia una è la sua trasmissione legata quasi esclusivamente alla forma orale, nonostante sia cospicua la quantità e la documentazione della lingua e della cultura. Un importante aspetto che si evince della cultura e delle tradizioni delle comunità arbëreshë è il profondo rispetto che attribuiscono all’ospite: secondo cui la casa dell’albanese è di Dio e dell’ospite, al quale si fa onore offrendogli semplici cibarie.",
                                            language: selectedLanguage,
                                          ),
                                          Divider(
                                            thickness: 0,
                                          ),
                                        ])))) /*Card(

                      clipBehavior: Clip.antiAlias,
                      elevation: 16,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Gli Arbëreshë sono considerati a tutti gli effetti un “miracolo” sociale (Pasolini për arbëreshët: “Një mrekulli antropologjike”). Anche dopo cinque secoli lontano dalla Madrepatria continuano a mantenere viva la lingua albanese, nonché il rito bizantino, le tradizioni ed gli usi, mostrandosi del tutto cittadini italiani, ma di stirpe e provenienza etnica diversa. Tra i tanti aspetti delle tradizioni albanesi d’Italia una è la sua trasmissione legata quasi esclusivamente alla forma orale, nonostante sia cospicua la quantità e la documentazione della lingua e della cultura. Un importante aspetto che si evince della cultura e delle tradizioni delle comunità arbëreshë è il profondo rispetto che attribuiscono all’ospite: secondo cui la casa dell’albanese è di Dio e dell’ospite, al quale si fa onore offrendogli semplici cibarie.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),
                          ),
                          Divider(
                            thickness: 0,
                          ),
                          PlayGuideButton(
                            textToPlay:
                                "Gli Arbëreshë sono considerati a tutti gli effetti un “miracolo” sociale (Pasolini për arbëreshët: “Një mrekulli antropologjike”). Anche dopo cinque secoli lontano dalla Madrepatria continuano a mantenere viva la lingua albanese, nonché il rito bizantino, le tradizioni ed gli usi, mostrandosi del tutto cittadini italiani, ma di stirpe e provenienza etnica diversa. Tra i tanti aspetti delle tradizioni albanesi d’Italia una è la sua trasmissione legata quasi esclusivamente alla forma orale, nonostante sia cospicua la quantità e la documentazione della lingua e della cultura. Un importante aspetto che si evince della cultura e delle tradizioni delle comunità arbëreshë è il profondo rispetto che attribuiscono all’ospite: secondo cui la casa dell’albanese è di Dio e dell’ospite, al quale si fa onore offrendogli semplici cibarie.",
                            language: selectedLanguage,
                          ),
                          Divider(
                            thickness: 0,
                          ),
                        ],
                      ),
                    )*/,
                  )),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  static String destinazionePagina = "";
  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: GestureDetector(
        onTap: () {
          print("Ciao");
        },
        child: LayoutBuilder(builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = [];

          for (var i = 0; i < images.length; i++) {
            destinazionePagina = title[i];
            var delta = i - currentPage;
            bool isOnRight = delta > 0;

            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.blue, boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0)
                  ]),
                  child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: Stack(
                        //overflow: Overflow.visible,
                        fit: StackFit.expand,
                        children: <Widget>[
                          //Image.network(images[i], fit: BoxFit.cover),
                          CachedNetworkImage(
                            placeholder: (context, url) => CircularProgressIndicator(),
                            imageUrl: images[i],fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Text(title[i],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "SF-Pro-Text-Regular")),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                /*Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, bottom: 12.0),

                                        child:  ElevatedButton(
                                          onPressed:(){
                                            print("Ciao");
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: Color.fromRGBO(160, 50, 41, 1),
                                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                              textStyle:
                                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                                          child: Text('Voglio saperne di più'),
                                        ),

                                    ),*/
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        }),
      ),
    );
  }
}
