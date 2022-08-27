import 'dart:convert';

class CardBorgoItinerario {
  final String linkIMG;
  final String titolo;
  final String descrizione;

  CardBorgoItinerario(
      {required this.linkIMG, required this.titolo, required this.descrizione});

  factory CardBorgoItinerario.fromJson(Map<String, dynamic> json) {
    return CardBorgoItinerario(
      linkIMG: json["linkIMG"] as String,
      titolo: json["titolo"] as String,
      descrizione: json["descrizione"] as String,
    );
  }
}

class Borgo {
  final String imgBorgo;
  final String nome;
  final String descrizione;
  final String piccolaDescrizione;
  final String sindaco;
  final String numeroAbitanti;
  final String altezza;
  final String numeriUtili;
  final String doveMangiare;
  final String doveDormire;
  final String linkGoogleMaps;
  final List<CardBorgoItinerario> cardsBorgo;

  Borgo(
      {required this.imgBorgo,
      required this.nome,
      required this.descrizione,
      required this.piccolaDescrizione,
      required this.sindaco,
      required this.numeroAbitanti,
      required this.altezza,
      required this.numeriUtili,
      required this.doveMangiare,
      required this.doveDormire,
      required this.linkGoogleMaps,
      required this.cardsBorgo});

  factory Borgo.fromJson(Map<String, dynamic> json) {
    var res = json['cardsBorgo'] as List;
    List<CardBorgoItinerario> result =
        res.map((e) => CardBorgoItinerario.fromJson(e)).toList();
    return Borgo(
      imgBorgo: json['imgBorgo'] as String,
      nome: json['nome'] as String,
      descrizione: json['descrizione'] as String,
      piccolaDescrizione: json['piccolaDescrizione'] as String,
      sindaco: json['sindaco'] as String,
      numeroAbitanti: json['numeroAbitanti'] as String,
      altezza: json['altezza'] as String,
      numeriUtili: json['numeriUtili'] as String,
      doveMangiare: json['doveMangiare'] as String,
      doveDormire: json['doveDormire'] as String,
      linkGoogleMaps: json['linkGoogleMaps'] as String,
      cardsBorgo: result,
    );
  }
}

int selectedBorgo = -1;
Map<String, Borgo> borghiList = <String, Borgo>{};
