// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io';
import 'package:translator/translator.dart';

class PlayGuideButton extends StatefulWidget {
  final String textToPlay;
  final String language;
  const PlayGuideButton(
      {Key? key, required this.textToPlay, required this.language})
      : super(key: key);

  @override
  _PlayGuideButtonState createState() => _PlayGuideButtonState();
}

/*L'idea è che loro mi passano il linguaggio selezionato dal DropDownMenuItem ed io, devo mettere il linguaggio del tts settato per quello selezionato
tradurre la frase con il Translator e passarla nello speak
 */
class _PlayGuideButtonState extends State<PlayGuideButton> {
  bool playing = false;
  bool isSpeaking = false;
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();
  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    Future _speak() async {
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.setLanguage(widget.language);
      await flutterTts.setPitch(1);
      await flutterTts.setVolume(1.0);
      String fraseTradotta = widget.textToPlay;
      if (widget.language != "it-IT") {

        var translation = await translator.translate(widget.textToPlay,
            to: widget.language[0] + widget.language[1]);

        fraseTradotta = translation.text;
      }

      await flutterTts.speak(fraseTradotta);
      //sleep(const Duration(seconds: 3));
      setState(() {
        playing = false;
      });
    }

    Future _pause() async {
      await flutterTts.stop();
    }

    appenaFiniscoDiParlare() {
      setState(() {
        playing = false;
        child:
        new Icon(Icons.play_circle);
      });
      print("Ciao");
    }

    return Center(
        child: FloatingActionButton(
            heroTag: getRandomString(4),
            backgroundColor: Color.fromRGBO(163, 52, 51, 1),
            onPressed: () {
              if (playing == true) {
                setState(() {
                  playing = false;
                  child:
                  new Icon(Icons.play_circle);
                });
                _pause();
              } else if (playing == false) {
                setState(() {
                  playing = true;
                  child:
                  new Icon(Icons.pause_circle);
                });
                _speak();
                final snackBar = SnackBar(

                  content: const Text('Potrebbe volerci qualche attimo!\nRicorda inoltre che nel MENU (in alto a sinistra) potrai cambiare la lingua e scegliere altri voci di menù'),
                  action: SnackBarAction(
                    label: 'Capito',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                /*List l = widget.textToPlay.split("");
            sleep(Duration(seconds: l.length));
            setState(() {
              playing = false;
              child: new Icon(Icons.play_circle);
            });*/
              }
            },
            tooltip: 'Play Music',
            child:
                playing ? new Icon(Icons.pause) : new Icon(Icons.play_circle)));
  }
}
