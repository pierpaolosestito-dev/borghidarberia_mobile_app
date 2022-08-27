/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_app/be/weather.dart';
class BorghiMeteo extends StatefulWidget {
  const BorghiMeteo({Key? key}) : super(key: key);

  @override
  _BorghiMeteoState createState() => _BorghiMeteoState();
}

class _BorghiMeteoState extends State<BorghiMeteo> {
  
  //WeatherFactory wf = WeatherFactory("dfba2bf7381bc7baf025f53705103670");

  //Weather w = await wf.currentWeatherByCityName("San Benedetto Ullano");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot){
            Weather? _weather;
            if(snapshot!=null){
              _weather = snapshot.data as Weather?;
              if(_weather == null){
                return Text("Errore");
              }else{
                return weatherBox(_weather);
              }
            }else{
              return CircularProgressIndicator();
            }

          },
          future: getMeteoCorrente("San Benedetto Ullano"),
        )
      )
    );
  }

  Widget weatherBox(Weather _weather){
    return Column(
      children: <Widget>[

        Center(child:Text("${_weather.temperatura}°C")),
        Center(child:Text("${_weather.descrizione}")),
        Center(child:Text("Feels: ${_weather.feelsLike}")),
        Center(child:Text("Temperatura minima: ${_weather.temperatura_minima}°C e Temperatura massima: ${_weather.temperatura_massima}°C")),
      ]
    );
  }

  Future getMeteoCorrente(String borgo) async{
    late Weather weather;
    String API_KEY = "dfba2bf7381bc7baf025f53705103670";
    var url= "https://api.openweathermap.org/data/2.5/weather?q=$borgo&appid=$API_KEY&units=metric";

    final response = await http.get(url);

    if(response.statusCode == 200){
      weather = Weather.fromJson(jsonDecode(response.body));
    }else{
      //MANNACC
    }
    return weather;
  }
}*/

