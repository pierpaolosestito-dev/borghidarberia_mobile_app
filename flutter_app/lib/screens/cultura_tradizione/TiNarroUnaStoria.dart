import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/widget/PlayGuideButton.dart';

import '../../globals.dart';

class TiNarroUnaStoria extends StatelessWidget {
  final Function(int) rebuild;
  TiNarroUnaStoria({required this.rebuild});

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
                          "LA LEGGENDA DI COSTANTINO E JURENDINA",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                        Center(
                            child: Text(
                          "Questa leggenda è presente in molti paesi arbëreshë e in Albania",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )),
                        Text(
                          "Questa leggenda è presente in molti paesi arbëreshë e in Albania C’era una volta una madre che aveva nove figli. La decima era una ragazza di nome Jurendina. Vennero a chiederla in sposa. La madre non voleva farla sposare perchè sarebbe andata a vivere molto lontano. Ma il primogenito, Costantino le disse:",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        //PARLATO NEL TESTO
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "– Non importa madre mia, che stia lontano, poiché quando vorrai vederla, andrò io a prendere mia sorella e te la porterò a casa.",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Color.fromRGBO(160, 50, 41, 1)),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "Così la madre la diede in sposa. Dopo un certo periodo arrivò la morte crudele che prese alla madre tutti i nove figli. La morte la rovinò, chiuse la porta di casa e invocò suo figlio.",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "– Costantino, figlio mio alzati e fai quello che avevi promesso!",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Color.fromRGBO(160, 50, 41, 1)),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "Costantino allora uscì dalla tomba. La terra che era dentro il sepolcro diventò un cavallo, egli vi montò sopra e giunse a casa della sorella ma non la trovò perchè era andata a un ballo. La fece chiamare, ella si incamminò verso casa e lì trovo suo fratello ad aspettarla.",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "– Fratello mio, dove devo venire? Vestita da sposa o da lutto?",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Color.fromRGBO(160, 50, 41, 1)),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "– Vestiti come ti ho portato, da sposa!",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Color.fromRGBO(160, 50, 41, 1)),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "Strada facendo ella chiese",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "– Costantino, fratello mio, quelle braccia che avevi una volta, non le hai più, sono così smagrite …",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Color.fromRGBO(160, 50, 41, 1)),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "Egli le rispose",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "– ti sembra sorella mia. É la polvere che fa il cavallo, è il fango che calpesta il cavallo!",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Color.fromRGBO(160, 50, 41, 1)),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "Arrivarono nei pressi di una chiesa, Costantino vi entrò e non comparve più perchè era tornato nel suo sepolcro. La ragazza andò da sua madre e bussò alla porta dicendo",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "– Aprimi la porta madre mia, sono tua figlia Jurendina!",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Color.fromRGBO(160, 50, 41, 1)),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "La madre allora spalancò la porta e abbracciò sua figlia (liberamente tratto da P. Vincenzo Malaj, Racconti popolari di Falconara Albanese).",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Center(
                          child:CachedNetworkImage(
                            imageUrl: "https://www.borghidarberia.it/wp-content/uploads/2021/09/leggenda-kostandini-e-jurendina-600x430.jpg",
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

                          /* Container(
                            width: 250.00,
                            height: 250.00,
                            decoration: new BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://www.borghidarberia.it/wp-content/uploads/2021/09/leggenda-kostandini-e-jurendina-600x430.jpg'),
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
                          "La Besa è la parola data da Costantino alla madre. Il termine indica il rispetto dei patti delle regole ed è quindi collegata all’onore, al rispetto della parola data, a quanto vi è di più sacro. É il Kanun che istituisce la Besa, sintesi delle istanze che reggono l’intera organizzazione sociale albanese. Il Kanun è un codice di leggi consuetudinarie, che si sono tramandate oralmente per secoli. Pur modificati, alcuni dei valori in esso contenuti, costituiscono il nocciolo duro dell’identità albanese. La traduzione di Kanun è Canone, cioè Regola (cit. Anna Maria Ragno).",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        PlayGuideButton(
                          textToPlay:
                              "C’era una volta una madre che aveva nove figli. La decima era una ragazza di nome Jurendina.Vennero a chiederla in sposa. La madre non voleva farla sposare perchè sarebbe andata a vivere molto lontano.Ma il primogenito, Costantino le disse...Non importa madre mia, che stia lontano, poiché quando vorrai vederla, andrò io a prendere mia sorella e te la porterò a casa. Così la madre la diede in sposa.Dopo un certo periodo arrivò la morte crudele che prese alla madre tutti i nove figli. La morte la rovinò, chiuse la porta di casa e invocò suo figlio... Costantino, figlio mio alzati e fai quello che avevi promesso! Costantino allora uscì dalla tomba. La terra che era dentro il sepolcro diventò un cavallo, egli vi montò sopra e giunse a casa della sorella ma non la trovò perchè era andata a un ballo. La fece chiamare, ella si incamminò verso casa e lì trovo suo fratello ad aspettarla... Fratello mio, dove devo venire? Vestita da sposa o da lutto?...Vestiti come ti ho portato, da sposa! Strada facendo ella chiese...Costantino, fratello mio, quelle braccia che avevi una volta, non le hai più, sono così smagrite …Egli le rispose...ti sembra sorella mia. É la polvere che fa il cavallo, è il fango che calpesta il cavallo!Arrivarono nei pressi di una chiesa, Costantino vi entrò e non comparve più perchè era tornato nel suo sepolcro. La ragazza andò da sua madre e bussò alla porta dicendo... Aprimi la porta madre mia, sono tua figlia Jurendina! La madre allora spalancò la porta e abbracciò sua figlia (liberamente tratto da P. Vincenzo Malaj, Racconti popolari di Falconara Albanese).La Besa è la parola data da Costantino alla madre.Il termine indica il rispetto dei patti delle regole ed è quindi collegata all’onore, al rispetto della parola data, a quanto vi è di più sacro.E il Kanun che istituisce la Besa, sintesi delle istanze che reggono l’intera organizzazione sociale albanese. Il Kanun è un codice di leggi consuetudinarie, che si sono tramandate oralmente per secoli.Pur modificati, alcuni dei valori in esso contenuti, costituiscono il nocciolo duro dell’identità albanese. La traduzione di Kanun è Canone, cioè Regola (citazione di. Anna Maria Ragno).",
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
