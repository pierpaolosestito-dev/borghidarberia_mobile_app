import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/models/borgo.dart';
import 'package:flutter_app/screens/borghi_list.dart';
import 'package:flutter_app/widget/PlayGuideButton.dart';

import '../globals.dart';

List<List<String>> stories2 = [
  [
    '1416,1446',
    'Giunsero in Italia truppe di soldati albanesi capitanati da Demetrio Reres ed inviati dal condottiero Skanderbeg per difendere Alfonso d’Aragona contro Roberto d’Angiò.'
  ],
  [
    '1459-1461',
    'Ci fu l’esodo di altri soldati in Puglia per difendere la casa aragonese di Ferdinando I, successore di Alfonso, contro la congiura dei baroni.'
  ],
  [
    '1459-1461',
    'I turchi invasero e distrussero tutta l’Albania e molti albanesi, per non sottomettersi al dominio ottomano, si insediarono in Calabria, in particolare in Sila, nel Pollino e nella valle del Crati.'
  ],
  [
    '1459-1461',
    'Gli albanesi della città di Corone, sfiniti dall’assedio turco, si spostarono verso la Puglia, la Lucania e la Calabria fondando nuove comunità. La migrazione ebbe il supporto di Carlo V che incaricò il viceré di Napoli di organizzare il viaggio degli albanesi. Circa ottomila persone si stanziarono tra Calabria e Sicilia.Questa migrazione fu diversa dalle precedenti perché includeva molti rappresentanti dell’aristocrazia albanese e numerosi privilegiati.'
  ],
  [
    '1459-1461',
    'Popolazioni provenienti dalla Morea si mossero verso la Basilicata.'
  ],
  [
    '1459-1461',
    'Popolazione proveniente da Illiria ed Epiro si stanziò in Abruzzo.'
  ],
  [
    '1459-1461',
    'Alcuni albanesi si stabilirono in Basilicata, nel pavese e a Piacenza.'
  ]
];
var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class StoriaScreen extends StatelessWidget {
  final Function(int, BuildContext, bool) selectScreen;
  final BuildContext parent;
  StoriaScreen({required this.selectScreen, required this.parent});

  //StoriaScreen(/*this.zoomDrawerController*/);

  Widget _generateChildrens(String _name, String _img) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: _img,
                  placeholder: (context, url) => LinearProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                  width: 1000.0,
                  height: 1000.0,
                ),
                /*Image.network(_img,
                    fit: BoxFit.fill, width: 1000.0, height: 1000.0)*/
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      _name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(234, 213, 230, 1)),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /*Flexible(
                  child: ),*/
              /*Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "I NOSTRI BORGHI",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              CarouselSlider(
                items: imgList
                    .map((item) => Container(
                            child: Center(
                                child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: 1000,
                        ))))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
              ),*/
              Flexible(
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
                                    CarouselSlider(
                                      options: CarouselOptions(
                                        autoPlay: true,
                                        aspectRatio: 2.0,
                                        enlargeCenterPage: true,
                                      ),
                                      items: () {
                                        List<Widget> toRet = [];
                                        borghiList.entries.forEach((element) {
                                          toRet.add(_generateChildrens(
                                              element.value.nome,
                                              element.value.imgBorgo));
                                        });
                                        return toRet;
                                      }(),
                                    ),
                                   SizedBox(height:50),
                                    Text(
                                        "Quest’anno partiamo dalla Calabria, con i ventuno comuni della provincia di Cosenza, in un viaggio alla scoperta dell’essenza del popolo Arbëreshë.L’area dedicata ai borghi d’Arberia è strutturata con settori dedicati a ogni singolo paese con notizie sul comune e a seguire tutto ciò che un turista può andare a conoscere in molti ambiti, anche esperienziali.Il percorso si snoda attraverso sessantatré itinerari che riguardano la cultura, la storia, la religione, l’arte, la natura, l’enogastronomia, con approfondimenti raccontati dalle persone del posto, protagonisti e testimoni della loro cultura.",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        )),
                                    Divider(
                                      thickness: 0,
                                    ),
                                    Center(
                                        child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(160, 50, 41, 1),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 10),
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      onPressed: () =>
                                          selectScreen(1, parent, false),
                                      child: Text('I NOSTRI BORGHI'),
                                    )),
                                    Divider(
                                      thickness: 0,
                                    ),
                                    PlayGuideButton(
                                      textToPlay:
                                          "Quest’anno partiamo dalla Calabria, con i ventuno comuni della provincia di Cosenza, in un viaggio alla scoperta dell’essenza del popolo Arbëreshë.L’area dedicata ai borghi d’Arberia è strutturata con settori dedicati a ogni singolo paese con notizie sul comune e a seguire tutto ciò che un turista può andare a conoscere in molti ambiti, anche esperienziali.Il percorso si snoda attraverso sessantatré itinerari che riguardano la cultura, la storia, la religione, l’arte, la natura, l’enogastronomia, con approfondimenti raccontati dalle persone del posto, protagonisti e testimoni della loro cultura.",
                                      language: selectedLanguage,
                                    ),
                                    Divider(
                                      thickness: 0,
                                    ),
                                  ]))))),


              //STO FACENDO MODIFICHE QUA

              /*Text(
                "LA NOSTRA GUIDA",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Divider(
                thickness: 0,
              ),
              Center(
                  child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://www.borghidarberia.it/wp-content/uploads/2021/08/schermata-nuova-1200x400.png',
                ),
                maxRadius: 130,
              )),
              Divider(
                thickness: 0,
              ),
              Center(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(160, 50, 41, 1),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Respond to button press
                },
                child: Text('Leggi'),
              )),*/
              Divider(
                thickness: 3,
                color: Color.fromRGBO(160, 50, 41, 1),
              ),
              Flexible(
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
                                    Center(
                                        child: Text(
                                      "LA STORIA ARBERESHE",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                                    Text(
                                      "L Arberia è un insieme di comunità in cui vive, in Italia, la minoranza etnico-linguistica degli Arbëreshë. Questo popolo arrivò in Italia in diversi flussi migratori provenienti dall Albania e da comunità albanofone della Grecia, tra il XV e il XVIII sec.Gli insediamenti albanesi nell Italia meridionale furono il prodotto di una mobilità lenta ma continua in tutto l alto medioevo, per motivi diplomatici, strategici, commerciali e religiosi. Probabilmente il nome Arbëreshë deriva dal nome Principato di Arber o di Arbanon, primo stato feudale medievale albanese fondato dopo la scissione dell impe­ro romano d Occidente da quello d Oriente. Secondo la maggior parte degli storiografi ci furono sette ondate migratorie avvenute tra il 1416 e il 1825.",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    Divider(
                                      thickness: 0,
                                    ),
                                    Center(
                                        child: CachedNetworkImage(
                                          imageUrl: "https://www.borghidarberia.it/wp-content/uploads/2021/09/leggenda-kostandini-e-jurendina-w700-600x444.jpg",
                                          imageBuilder: (context, imageProvider) => Container(
                                            width: 300.00,
                                            height: 300.00,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                  ),
                                            ),
                                          ),
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),

                                      /*Container(
                                          width: 250.00,
                                          height: 250.00,
                                          decoration: new BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                              NetworkImage(
                                                  'https://www.borghidarberia.it/wp-content/uploads/2021/09/leggenda-kostandini-e-jurendina-w700-600x444.jpg'),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: BoxShape.rectangle,
                                          ),
                                        )*/
                                      ),

                                    Divider(
                                      thickness: 0,
                                    ),
                                    Text(
                                        "In tutto il medioevo molti albanesi si trasferirono a Venezia per motivi di lavoro e fondarono la confraternita “Scola degli Albanesi” a scopo umanitario per sostenere connazionali in difficoltà. Si può in definitiva dire che Skanderbeg iniziò un fruttuoso scambio politico ed economico con l’Italia, in particolare con Alfonso d’Aragona. Da qui nacque una forte alleanza dal deciso impatto storico, culturale e sociale. Lo stan­ziamento attraversò vari fasi storiche e l’Adriatico fu un ricco canale di scambio econo­mico e culturale.Gli albanesi, in Italia, usufruirono di speciali concessioni e privilegi nelle terre dove furono accolti. Si insediarono o ripopolarono zone e villaggi isolati e questi luoghi, in prevalenza montani, consentirono di proteggere meglio la cultura identitaria. Contribuirono fortemente all’espansione demografica e allo sviluppo dei territori depauperati dallo spopolamento e dall’abbandono delle coltivazioni.Uno dei tratti caratte­rizzanti del popolo Arbëreshë è la fede cristiana di rito bizan­tino insieme al ricco patrimonio di lingua, cultura e tradizione.",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        )),
                                    Divider(
                                      thickness: 0,
                                    ),
                                    Center(
                                      child:CachedNetworkImage(
                                        imageUrl: "https://www.borghidarberia.it/wp-content/uploads/2021/09/Skanderbeg-guida-la-migrazione-w700-600x447.jpg",
                                        imageBuilder: (context, imageProvider) => Container(
                                          width: 300.00,
                                          height: 300.00,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) => CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      )
                                      /* Container(
                                        width: 250.00,
                                        height: 250.00,
                                        decoration: new BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://www.borghidarberia.it/wp-content/uploads/2021/09/Skanderbeg-guida-la-migrazione-w700-600x447.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: BoxShape.rectangle,
                                        ),
                                      )*/
                                    ),
                                    Divider(
                                      thickness: 0,
                                    ),
                                    PlayGuideButton(
                                      textToPlay:
                                          "In tutto il medioevo molti albanesi si trasferirono a Venezia per motivi di lavoro e fondarono la confraternita “Scola degli Albanesi” a scopo umanitario per sostenere connazionali in difficoltà. Si può in definitiva dire che Skanderbeg iniziò un fruttuoso scambio politico ed economico con l’Italia, in particolare con Alfonso d’Aragona. Da qui nacque una forte alleanza dal deciso impatto storico, culturale e sociale. Lo stan­ziamento attraversò vari fasi storiche e l’Adriatico fu un ricco canale di scambio econo­mico e culturale.Gli albanesi, in Italia, usufruirono di speciali concessioni e privilegi nelle terre dove furono accolti. Si insediarono o ripopolarono zone e villaggi isolati e questi luoghi, in prevalenza montani, consentirono di proteggere meglio la cultura identitaria. Contribuirono fortemente all’espansione demografica e allo sviluppo dei territori depauperati dallo spopolamento e dall’abbandono delle coltivazioni.Uno dei tratti caratte­rizzanti del popolo Arbëreshë è la fede cristiana di rito bizan­tino insieme al ricco patrimonio di lingua, cultura e tradizione.",
                                      language: selectedLanguage,
                                    ),
                                    Divider(
                                      thickness: 0,
                                    ),
                                  ]))))),
              Divider(
                thickness: 3,
                color: Color.fromRGBO(160, 50, 41, 1),
              ),
              Flexible(
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
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Center(
                                      child: Text(
                                    "CULTURA E TRADIZIONE",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
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
                                  Center(
                                      child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Color.fromRGBO(160, 50, 41, 1),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 10),
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () =>
                                        selectScreen(7, parent, false),
                                    child: Text('VOGLIO SAPERNE DI PIU'),
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
                                  /*
                          CardScrollWidget(currentPage),
                          Positioned.fill(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: images.length,
                              controller: controller,
                              reverse: true,

                              itemBuilder: (context, index) {
                                return Container(width: (MediaQuery.of(context).size.height) - 30);
                              },
                            ),
                          ),*/
                                ])),
                      ))),
              Divider(
                thickness: 0,
              ),
              Center(
                  child: Text(
                "HISTORY-TIMELINE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
              Flexible(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        var lunghezza = stories2[index][1].length;
                        return Container(
                            child: Row(
                          children: <Widget>[
                            Column(children: <Widget>[
                              Container(
                                width: 2,
                                color: Colors.black,
                                height: lunghezza.toDouble(),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.shade300,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: /*Icon(
                              Icons.home,
                              color: Colors.black54,
                            ),*/
                                      Image.network(
                                    "https://i.postimg.cc/vmCPwp4w/kisspng-flag-of-albania-national-flag-principality-of-alba-eagle-flag-5ae0b94a73e758-150667581524676.png",
                                    width: 40,
                                    height: 40,
                                  )),
                              Container(
                                width: 2,
                                height: 50,
                                color: Colors.black,
                              ),
                            ]),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        border: Border(
                                            left: BorderSide(
                                                width: 4,
                                                color: Color.fromRGBO(
                                                    160, 50, 41, 1))),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10,
                                            color: Colors.grey,
                                          )
                                        ]),
                                    child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "${stories2[index][0]}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                "${stories2[index][1]}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                            ]))))
                          ],
                        ));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
