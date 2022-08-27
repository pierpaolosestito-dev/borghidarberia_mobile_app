import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/widget/PlayGuideButton.dart';

import '../../globals.dart';

class EParchiaLungro extends StatelessWidget {
  final Function(int) rebuild;
  EParchiaLungro({required this.rebuild});

  void returnBack() {
    rebuild(-1);
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
              width: (MediaQuery.of(context).size.width) - 10,
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: Color.fromRGBO(160, 50, 41, 1), width: 10)),
                color: Colors.grey.shade300,
              ),
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextButton(
                            onPressed: returnBack, child: Text("Torna indietro")),
                        Center(
                            child: Text(
                          "EPARCHIA DI LUNGRO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                        Text(
                          "Il 13 febbraio 1919, papa Benedetto XV ha unito in un unico corpo ecclesiale e giuridico i discendenti dei profughi albanesi e greci dei secoli XV-XVIII con la costituzione apostolica Catholici fideles e l’istituzione dell’Eparchia di Lungro degli Italo-albanesi dell’Italia continentale. L’istituzione della nostra Eparchia è stato un giusto riconoscimento alle attese e richieste di custodia e coltivazione del patrimonio degli avi e con questo atto la Santa Sede ha anche indicato profeticamente agli Arbëreshë la pista unitaria da seguire. L’unità ecclesiale ha favorito il contatto di persone di vari paesi, distanti tra di loro, favorendo l’uso della lingua materna e del cuore e contribuendo a custodirne la memoria. Ma soprattutto è valsa a mantenere vivo il patrimonio ecclesiale di tradizione bizantina, elemento caratterizzante dell’Arberia, fino al raggiungimento di una fisionomia di chiesa orientale pienamente inserita nella Chiesa Cattolica.",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Center(
                          child: CachedNetworkImage(
                            imageUrl: "https://www.borghidarberia.it/wp-content/uploads/2021/09/eparchia-di-lungro.jpg",
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
                                image: NetworkImage(
                                    'https://www.borghidarberia.it/wp-content/uploads/2021/09/eparchia-di-lungro.jpg'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          ),*/
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "L’Eparchia di Lungro, nella sua breve ma significativa storia, registra quattro vescovi: il primo è stato mons. Giovanni Mele, eletto all’età di appena trentaquattro anni. Egli ha retto l’Eparchia dal 1919 al 1979 e si è eroicamente impegnato nell’ardua impresa di dare unitarietà alle parrocchie della novella Eparchia che, fino a quel momento, avevano fatto parte di ben sei diverse diocesi. Il suo successore, mons. Giovanni Starnati, nel suo impegno pastorale, ha proceduto con eguale zelo apostolico al recupero della spiritualità bizantina e per una uniforme fisionomia ecclesiale nel segno della continuità, della custodia e della valorizzazione del patrimonio spirituale. A ridosso del Concilio Vaticano Il, nel 1968, con un proprio decreto, ha inserito l’uso liturgico della lingua albanese. Il terzo vescovo, mons. Ercole Lupinacci, dal 1988 al 2010, ha provveduto ad elevare alla confacente dignità il patrimonio liturgico ed iconografico delle Chiese parrocchiali portandole a una configurazione più aderente alla tradizione bizantina. Nel corso del suo ministero è stata celebrata la Prima Assemblea Eparchiale dalla quale è stato emanato un compendio di indicazioni per una buona vita ecclesiale, comunitaria e individuale, in linea con il patrimonio spirituale orientale. L’attuale vescovo, mons. Donato Oliverio, ha ereditato una diocesi saldamente piantata in occidente dove rende visibile con estrema chiarezza le ricchezze della tradizione bizantina e la bellezza della possibile unità tra i cristiani di Occidente e di Oriente nella differenza delle tradizioni e nella diversità delle lingue. Il vescovo Donato vuole guidare l’Eparchia di Lungro con i suoi fedeli Arbëreshë – di tradizione bizantina vissuta in piena comunione in un territorio di tradizione latina – a spendersi per l’unità dei cristiani per esprimere profeticamente il futuro prossimo della chiesa: l’unità della retta fede e nell’abbondante ricchezza delle varietà ecclesiali.",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Center(
                          child: CachedNetworkImage(
                            imageUrl: "https://www.borghidarberia.it/wp-content/uploads/2021/09/Mons.-Oliverio-Eparchia-di-Lungro.jpg",
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
                                image: NetworkImage(
                                    'https://www.borghidarberia.it/wp-content/uploads/2021/09/Mons.-Oliverio-Eparchia-di-Lungro.jpg'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          ),*/
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "Mons. Oliverio regge l’Eparchia dalla sede di Lungro, una ridente cittadina di circa tremila abitanti, posta sul versante Sud-Ovest della catena montuosa del Pollino, ai piedi del Monte Petrosa, a circa seicento metri di altitudine. Il suo trono si trova nella Chiesa Madre di tutte le Chiese dell’Eparchia, la Cattedrale di San Nicola di Mira, costruita tra il 1721 e il 1825. Oggi i fedeli dell’Eparchia sono circa quarantamila nei paesi e altrettanti sono sparsi in varie città della penisola italiana e ad assisterli nel loro cammino di divinizzazione ci sono una cinquantina di Papàs. Sono trenta le comunità parrocchiali Arbëreshë di rito bizantino, ubicate in piccoli centri sparsi, la stragrande maggioranza nel cosentino, ma anche in Basilicata, a Lecce, a Bari e a Villa Badessa nei pressi di Pescara. In questi centri gli abitanti, per strada e in famiglia, parlano arbërisht e nelle chiese, durante le ufficiature liturgiche, i fedeli pregano e cantano in greco e albanese.",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        PlayGuideButton(
                          textToPlay:
                              "Il 13 febbraio 1919, papa Benedetto XV ha unito in un unico corpo ecclesiale e giuridico i discendenti dei profughi albanesi e greci dei secoli XV-XVIII con la costituzione apostolica Catholici fideles e l’istituzione dell’Eparchia di Lungro degli Italo-albanesi dell’Italia continentale. L’istituzione della nostra Eparchia è stato un giusto riconoscimento alle attese e richieste di custodia e coltivazione del patrimonio degli avi e con questo atto la Santa Sede ha anche indicato profeticamente agli Arbëreshë la pista unitaria da seguire. L’unità ecclesiale ha favorito il contatto di persone di vari paesi, distanti tra di loro, favorendo l’uso della lingua materna e del cuore e contribuendo a custodirne la memoria. Ma soprattutto è valsa a mantenere vivo il patrimonio ecclesiale di tradizione bizantina, elemento caratterizzante dell’Arberia, fino al raggiungimento di una fisionomia di chiesa orientale pienamente inserita nella Chiesa Cattolica.L’Eparchia di Lungro, nella sua breve ma significativa storia, registra quattro vescovi: il primo è stato mons. Giovanni Mele, eletto all’età di appena trentaquattro anni. Egli ha retto l’Eparchia dal 1919 al 1979 e si è eroicamente impegnato nell’ardua impresa di dare unitarietà alle parrocchie della novella Eparchia che, fino a quel momento, avevano fatto parte di ben sei diverse diocesi. Il suo successore, mons. Giovanni Starnati, nel suo impegno pastorale, ha proceduto con eguale zelo apostolico al recupero della spiritualità bizantina e per una uniforme fisionomia ecclesiale nel segno della continuità, della custodia e della valorizzazione del patrimonio spirituale. A ridosso del Concilio Vaticano Il, nel 1968, con un proprio decreto, ha inserito l’uso liturgico della lingua albanese. Il terzo vescovo, mons. Ercole Lupinacci, dal 1988 al 2010, ha provveduto ad elevare alla confacente dignità il patrimonio liturgico ed iconografico delle Chiese parrocchiali portandole a una configurazione più aderente alla tradizione bizantina. Nel corso del suo ministero è stata celebrata la Prima Assemblea Eparchiale dalla quale è stato emanato un compendio di indicazioni per una buona vita ecclesiale, comunitaria e individuale, in linea con il patrimonio spirituale orientale. L’attuale vescovo, mons. Donato Oliverio, ha ereditato una diocesi saldamente piantata in occidente dove rende visibile con estrema chiarezza le ricchezze della tradizione bizantina e la bellezza della possibile unità tra i cristiani di Occidente e di Oriente nella differenza delle tradizioni e nella diversità delle lingue. Il vescovo Donato vuole guidare l’Eparchia di Lungro con i suoi fedeli Arbëreshë – di tradizione bizantina vissuta in piena comunione in un territorio di tradizione latina – a spendersi per l’unità dei cristiani per esprimere profeticamente il futuro prossimo della chiesa: l’unità della retta fede e nell’abbondante ricchezza delle varietà ecclesiali.Mons. Oliverio regge l’Eparchia dalla sede di Lungro, una ridente cittadina di circa tremila abitanti, posta sul versante Sud-Ovest della catena montuosa del Pollino, ai piedi del Monte Petrosa, a circa seicento metri di altitudine. Il suo trono si trova nella Chiesa Madre di tutte le Chiese dell’Eparchia, la Cattedrale di San Nicola di Mira, costruita tra il 1721 e il 1825. Oggi i fedeli dell’Eparchia sono circa quarantamila nei paesi e altrettanti sono sparsi in varie città della penisola italiana e ad assisterli nel loro cammino di divinizzazione ci sono una cinquantina di Papàs. Sono trenta le comunità parrocchiali Arbëreshë di rito bizantino, ubicate in piccoli centri sparsi, la stragrande maggioranza nel cosentino, ma anche in Basilicata, a Lecce, a Bari e a Villa Badessa nei pressi di Pescara. In questi centri gli abitanti, per strada e in famiglia, parlano arbërisht e nelle chiese, durante le ufficiature liturgiche, i fedeli pregano e cantano in greco e albanese.",
                          language: selectedLanguage,
                        ),
                        Divider(
                          thickness: 0,
                        ),
                      ])))),
    );
  }

  Future<bool> _willPopCallback() async {
    returnBack();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: _body(context),
    );
  }
}
