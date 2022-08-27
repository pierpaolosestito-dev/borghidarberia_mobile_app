import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/widget/PlayGuideButton.dart';

import '../../globals.dart';

class LaGjiotona extends StatelessWidget {
  final Function(int) rebuild;
  LaGjiotona({required this.rebuild});

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
                          "LA GJITONIA",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                        Center(
                            child: Text(
                          "IL VICINATO ARBËRESHË TRA STRUTTURA ARCHITETTONICA E RITI",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                        Text(
                          'L’identità e la diversità Arbëreshë (italo-albanese) si radica profondamente nella memoria storica e si esprime, oltre che nella lingua, nel rito religioso, nella cultura e nei comportamenti sociali, in un particolare microrganismo urbano: la Gjitonia.Il termine Gjitonia (letteralmente “il vicinato“) si usa sia per indicare un particolare gruppo sociale (clan), posto in una posizione intermedia tra la famiglia e la comunità di villaggio, sia per identificare una particolare area dell’aggregato urbano.“La Gjitonia può essere definita il quartiere-stato, ed è, senza dubbio, la struttura più importante della cultura arbëreshë. All’interno della gjitonia avveniva, infatti, tutta l’attività politica, sociale ed economica della famiglia” (Siciliano G. C. 1988).Innanzitutto vi è uno spiazzo (sheshi) verso il quale sono rivolte le porte di quattro o cinque case; dallo spiazzo si sviluppa un sistema viario che si collega ad altri spiazzi che a loro volta si collegano con altri ancora fino ai confini del tessuto urbano.La vita di tutti i membri delle famiglie con l’accesso delle case rivolte allo spiazzo si realizzava, e in buona parte si realizza anche oggi, quasi sempre in un costante rapporto di interrelazione o azione comune nonché di solidarietà (Marchianò G. 1981).Cesare Pitto sostiene che: “La gjitonia è un livello esistente e operante sia in senso strutturale che in senso culturale, come comunità specifica dell’area arbëreshë. Essa genera nelle relazioni tra i membri del gruppo, vincoli affettivi che raggiungono e a volte superano, gli stessi legami di parentela. Vincoli affettivi, in occasione di morte, malattie, matrimoni, vincoli economici, nel corso dei vari cicli produttivi della campagna, vincoli anche matrimoniali, in positivo o in negativo, comunque con prescrizioni, sono tutti parte di quella composizione che viene identificata col termine “gjitonia“.Una definizione antropologica quella di Pitto che trova una immediata attuazione nel vecchio detto albanese “Gjitoni eshte ime vella” ossia “il vicino è mio fratello” (Pitto C. 1983; Fileni 1996).',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        PlayGuideButton(
                          textToPlay:
                              'L’identità e la diversità Arbëreshë (italo-albanese) si radica profondamente nella memoria storica e si esprime, oltre che nella lingua, nel rito religioso, nella cultura e nei comportamenti sociali, in un particolare microrganismo urbano: la Gjitonia.Il termine Gjitonia (letteralmente “il vicinato“) si usa sia per indicare un particolare gruppo sociale (clan), posto in una posizione intermedia tra la famiglia e la comunità di villaggio, sia per identificare una particolare area dell’aggregato urbano.“La Gjitonia può essere definita il quartiere-stato, ed è, senza dubbio, la struttura più importante della cultura arbëreshë. All’interno della gjitonia avveniva, infatti, tutta l’attività politica, sociale ed economica della famiglia” (Siciliano G. C. 1988).Innanzitutto vi è uno spiazzo (sheshi) verso il quale sono rivolte le porte di quattro o cinque case; dallo spiazzo si sviluppa un sistema viario che si collega ad altri spiazzi che a loro volta si collegano con altri ancora fino ai confini del tessuto urbano.La vita di tutti i membri delle famiglie con l’accesso delle case rivolte allo spiazzo si realizzava, e in buona parte si realizza anche oggi, quasi sempre in un costante rapporto di interrelazione o azione comune nonché di solidarietà (Marchianò G. 1981).Cesare Pitto sostiene che: “La gjitonia è un livello esistente e operante sia in senso strutturale che in senso culturale, come comunità specifica dell’area arbëreshë. Essa genera nelle relazioni tra i membri del gruppo, vincoli affettivi che raggiungono e a volte superano, gli stessi legami di parentela. Vincoli affettivi, in occasione di morte, malattie, matrimoni, vincoli economici, nel corso dei vari cicli produttivi della campagna, vincoli anche matrimoniali, in positivo o in negativo, comunque con prescrizioni, sono tutti parte di quella composizione che viene identificata col termine “gjitonia“.Una definizione antropologica quella di Pitto che trova una immediata attuazione nel vecchio detto albanese “Gjitoni eshte ime vella” ossia “il vicino è mio fratello” (Pitto C. 1983; Fileni 1996).',
                          language: selectedLanguage,
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Center(
                          child: CachedNetworkImage(
                            imageUrl: "https://www.borghidarberia.it/wp-content/uploads/2021/09/la-gjitonia.jpg",
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
                                    'https://www.borghidarberia.it/wp-content/uploads/2021/09/la-gjitonia.jpg'),
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
                          "La vita sociale della gjitonia, nonostante la figura del capofamiglia (Tate), era articolata in senso orizzontale, all’interno della quale si era cementificata la cultura dell’integrazione sociale e della solidarietà per la quale i bisogni di uno sono i bisogni di tutti.Il bambino arbëresh nasceva e cresceva in una dimensione spaziale e affettiva ben più estesa rispetto alla sola famiglia biologica o alla propria casa in quanto membro della Gjitonia che di lui si curava con la stessa intensità dei genitori, trasmettendogli valori e saperi, condividendo gioie e dolori, insegnandogli a convivere con i suoi altri “fratelli” (Gjiton) parlando la lingua arbëreshë, praticando tutti i giochi stagionali e facendosi coinvolgere nei problemi degli altri membri della gjitonia, imparando a vivere tutti insieme e aiutandosi senza niente in cambio.Un famoso detto arbëresh dice “Gjitonia gjiria“: vicinato parentato.",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        PlayGuideButton(
                          textToPlay:
                              "La vita sociale della gjitonia, nonostante la figura del capofamiglia (Tate), era articolata in senso orizzontale, all’interno della quale si era cementificata la cultura dell’integrazione sociale e della solidarietà per la quale i bisogni di uno sono i bisogni di tutti.Il bambino arbëresh nasceva e cresceva in una dimensione spaziale e affettiva ben più estesa rispetto alla sola famiglia biologica o alla propria casa in quanto membro della Gjitonia che di lui si curava con la stessa intensità dei genitori, trasmettendogli valori e saperi, condividendo gioie e dolori, insegnandogli a convivere con i suoi altri “fratelli” (Gjiton) parlando la lingua arbëreshë, praticando tutti i giochi stagionali e facendosi coinvolgere nei problemi degli altri membri della gjitonia, imparando a vivere tutti insieme e aiutandosi senza niente in cambio.Un famoso detto arbëresh dice “Gjitonia gjiria“: vicinato parentato.",
                          language: selectedLanguage,
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Center(
                          child: CachedNetworkImage(
                            imageUrl: "https://www.borghidarberia.it/wp-content/uploads/2021/09/La-Gjitonia-02.jpg",
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
                                    'https://www.borghidarberia.it/wp-content/uploads/2021/09/La-Gjitonia-02.jpg'),
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
                          "Nelle comunità arbëreshë, fino a qualche decennio fa, la vita dei bambini, dei ragazzi e dei giovani si svolgeva nelle strade e nelle piazze, dove, correndo e giocando, si apprendevano e si tramandavano la lingua e i giochi.Da un saggio di Giuseppe Cacozza si apprende di una raccolta di oltre 140 schede di rilevazione giochi, con le singole descrizioni e con le diverse varianti, trasformazioni e strumenti adoperati. Ad oggi, purtroppo, solo alcuni giochi sono ricordati ed in uso.I giochi in piazza, con gli strumenti popolari di un tempo, sono in via di estinzione.Ma ricordiamone alcuni davvero significativi: nella comunità di San Cosmo Albanese era popolarissimo il gioco gropëzit (il gioco dei buchetti), praticato all’aria aperta su un terreno asciutto e pianeggiante, a volte nel piazzale del vicinato (te gjitonia), e consisteva nel riuscire a tirare e far entrare una pallina in 5 buchetti opportunamente preparati sul terreno, in uno spazio di 50 cm. Ogni giocatore metteva nelle buche la posta stabilita (monete o bottoni), chi riusciva a mandare la pallina nei buchetti laterali vinceva la singola puntata, mentre chi mandava la pallina nella buca centrale vinceva l’intera posta in gioco.Altro gioco popolare è il gioco dell’Anello (sheha-sheha unazen), conosciuto come il gioco femminile albanese più diffuso. Il gioco veniva praticato dalle amiche raccolte in cerchio nel piazzale della gjitonia o davanti al focolare.Una delle partecipanti, fungendo da capo-gioco teneva tra le mani ben congiunte un anello. Le altre disposte a cerchio se ne stavano sedute con le mani unite sul grembo o sulle gambe. La capo-gioco, con l’anello ben nascosto, passava la fila delle amiche infilando le mani congiunte fra quelle delle partecipanti, lasciando l’anello in una di esse.Finito il giro, la capo-gioco chiedeva alle singole partecipanti chi avesse l’anello “kush e ka unazen?“, chi indovinava prendeva il posto di capo-gioco.A San Giorgio Albanese, durante la fase di occultamento dell’anello si usava l’espressione shala shala unazen (gamba-gamba l’anello), forse perché le mani congiunte venivano tenute sulle gambe (G. Cacozza 1988).",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        PlayGuideButton(
                          textToPlay:
                              "Nelle comunità arbëreshë, fino a qualche decennio fa, la vita dei bambini, dei ragazzi e dei giovani si svolgeva nelle strade e nelle piazze, dove, correndo e giocando, si apprendevano e si tramandavano la lingua e i giochi.Da un saggio di Giuseppe Cacozza si apprende di una raccolta di oltre 140 schede di rilevazione giochi, con le singole descrizioni e con le diverse varianti, trasformazioni e strumenti adoperati. Ad oggi, purtroppo, solo alcuni giochi sono ricordati ed in uso.I giochi in piazza, con gli strumenti popolari di un tempo, sono in via di estinzione.Ma ricordiamone alcuni davvero significativi: nella comunità di San Cosmo Albanese era popolarissimo il gioco gropëzit (il gioco dei buchetti), praticato all’aria aperta su un terreno asciutto e pianeggiante, a volte nel piazzale del vicinato (te gjitonia), e consisteva nel riuscire a tirare e far entrare una pallina in 5 buchetti opportunamente preparati sul terreno, in uno spazio di 50 cm. Ogni giocatore metteva nelle buche la posta stabilita (monete o bottoni), chi riusciva a mandare la pallina nei buchetti laterali vinceva la singola puntata, mentre chi mandava la pallina nella buca centrale vinceva l’intera posta in gioco.Altro gioco popolare è il gioco dell’Anello (sheha-sheha unazen), conosciuto come il gioco femminile albanese più diffuso. Il gioco veniva praticato dalle amiche raccolte in cerchio nel piazzale della gjitonia o davanti al focolare.Una delle partecipanti, fungendo da capo-gioco teneva tra le mani ben congiunte un anello. Le altre disposte a cerchio se ne stavano sedute con le mani unite sul grembo o sulle gambe. La capo-gioco, con l’anello ben nascosto, passava la fila delle amiche infilando le mani congiunte fra quelle delle partecipanti, lasciando l’anello in una di esse.Finito il giro, la capo-gioco chiedeva alle singole partecipanti chi avesse l’anello “kush e ka unazen?“, chi indovinava prendeva il posto di capo-gioco.A San Giorgio Albanese, durante la fase di occultamento dell’anello si usava l’espressione shala shala unazen (gamba-gamba l’anello), forse perché le mani congiunte venivano tenute sulle gambe (G. Cacozza 1988).",
                          language: selectedLanguage,
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Center(
                          child: CachedNetworkImage(
                            imageUrl: "https://www.borghidarberia.it/wp-content/uploads/2021/09/La-Gjitonia-03-600x600.jpg",
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
                                    'https://www.borghidarberia.it/wp-content/uploads/2021/09/La-Gjitonia-03-600x600.jpg'),
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
                          "A San Demetrio Corone, un famoso gioco praticato dalle donne era “Rrasku e Cukulli” (tavoletta e legnetto), come da foto, praticato soprattutto durante le festività Pasquali.Gli strumenti da gioco erano una tavoletta a forma di tagliere e un legnetto appuntito alle estremità. Il gioco consisteva nel colpire la punta del legnetto con la tavoletta per farlo sollevare da terra e colpirlo poi una seconda volta per farlo avanzare lungo il percorso prestabilito, che a volte seguiva stradine e viottoli nelle varie Gjitonie del paese, fino a raggiungere la meta.Gli uomini Sandemetresi, invece, amavano il “gioco del formaggio” Rola (il disco): prendevano le forme di formaggio molto stagionato e le lanciavano, facendole rotolare come palle da bowling, su un percorso stabilito, stando attenti a non far rompere la forma di formaggio, fino a raggiungere la meta.Pochi sono i giochi ancora in uso, molti ancora ricordati, altri ormai dimenticati, ma è innegabile la funzione e la validità pedagogica, linguistica e culturale dei giochi tradizionali arbëreshë.Risulterebbe interessante approfondire ulteriormente gli aspetti sociali, pedagogici e culturali dei giochi che avvenivano nelle gjitonie, anche al fine di confrontarli con i giochi e con le relazioni di prossimità che avvengono oggi tra persone che abitano in uno stesso rione e chissà, magari restituire un sapore più umano allo stare insieme.",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        PlayGuideButton(
                          textToPlay:
                              "A San Demetrio Corone, un famoso gioco praticato dalle donne era “Rrasku e Cukulli” (tavoletta e legnetto), come da foto, praticato soprattutto durante le festività Pasquali.Gli strumenti da gioco erano una tavoletta a forma di tagliere e un legnetto appuntito alle estremità. Il gioco consisteva nel colpire la punta del legnetto con la tavoletta per farlo sollevare da terra e colpirlo poi una seconda volta per farlo avanzare lungo il percorso prestabilito, che a volte seguiva stradine e viottoli nelle varie Gjitonie del paese, fino a raggiungere la meta.Gli uomini Sandemetresi, invece, amavano il “gioco del formaggio” Rola (il disco): prendevano le forme di formaggio molto stagionato e le lanciavano, facendole rotolare come palle da bowling, su un percorso stabilito, stando attenti a non far rompere la forma di formaggio, fino a raggiungere la meta.Pochi sono i giochi ancora in uso, molti ancora ricordati, altri ormai dimenticati, ma è innegabile la funzione e la validità pedagogica, linguistica e culturale dei giochi tradizionali arbëreshë.Risulterebbe interessante approfondire ulteriormente gli aspetti sociali, pedagogici e culturali dei giochi che avvenivano nelle gjitonie, anche al fine di confrontarli con i giochi e con le relazioni di prossimità che avvengono oggi tra persone che abitano in uno stesso rione e chissà, magari restituire un sapore più umano allo stare insieme.",
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
