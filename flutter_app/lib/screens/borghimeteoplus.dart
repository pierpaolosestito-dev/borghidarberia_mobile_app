import 'package:flutter_app/screens/borgo_viewer.dart';
import 'package:weather/weather.dart';
import 'package:flutter/material.dart';
class BorghiMeteoPlus extends StatefulWidget {
  final String cityToFetchWeatherPrevision;
  final Function(int) rebuild;
  const BorghiMeteoPlus({Key? key,required this.cityToFetchWeatherPrevision,required this.rebuild}) : super(key: key);
  static int aa = DateTime.now().day;
  @override
  _BorghiMeteoPlusState createState() => _BorghiMeteoPlusState();

}
enum AppState { NON_SCARICATO, SCARICAMENTO, SCARICAMENTO_TERMINATO }
class _BorghiMeteoPlusState extends State<BorghiMeteoPlus> {
  void returnBack() {
    print ("ho k");
    widget.rebuild(-1);
  }
  String key = "dfba2bf7381bc7baf025f53705103670";
  late WeatherFactory ws;
  List<Weather> _data = [];
  late Weather actualWeather;
  late String nameCity;
  AppState _state = AppState.SCARICAMENTO;
  bool isLoading = true;
  late int _dataScorrimento = DateTime.now().day;


  _BorghiMeteoPlusState() {
    print("Costruttore");
    _dataScorrimento = DateTime
        .now()
        .day;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ws = new WeatherFactory(key);
    print("initState");



  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    fetch_previsioniMeteo();
    fetch_meteoAttuale();
  }
  void fetch_previsioniMeteo() async{
    FocusScope.of(context).requestFocus(FocusNode());

    var previsioni = await ws.fiveDayForecastByCityName(
    widget.cityToFetchWeatherPrevision);

    setState(() {
      _data = previsioni;
      Future.delayed(Duration(seconds: 1));

      _state = AppState.SCARICAMENTO_TERMINATO;
      print("SCARICAMENTO TERMINATO");
      //_dataScorrimento = previsioni[0].date!.day;

    });
    //print(_dataScorrimento);

  }
  void fetch_meteoAttuale() async{
    FocusScope.of(context).requestFocus(FocusNode());

    Weather weather = await ws.currentWeatherByCityName(widget.cityToFetchWeatherPrevision);
    setState((){
      actualWeather = weather;
      Future.delayed(Duration(seconds: 1));
      _state = AppState.SCARICAMENTO_TERMINATO;
    });

    print("HO FINITO");
  }



  Widget contentDownloading() {
    return Container(
      margin: EdgeInsets.all(25),
      child: Column(children: [
        Text(
          "Caricamento previsioni Meteo - Borghi D'Arberia",
          style: TextStyle(fontSize: 20),
        ),
        Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(child: CircularProgressIndicator(strokeWidth: 10)))
      ]),
    );
  }

  Widget getImage(String weatherDescription){
    bool giorno = true;
    DateTime _now = DateTime.now();

    if(_now.hour > 17)
      giorno = false;

    //THUNDERSTORM
    if(weatherDescription.contains("thunderstorm")){
      if(giorno) {
        return Image.network("http://openweathermap.org/img/wn/11d@2x.png",width:80,height:80,);
      } else
        return Image.network("http://openweathermap.org/img/wn/11n@2x.png",width:80,height:80,);
    }
    //DRIZZLE
    if(weatherDescription.contains("drizzle")){
      if(giorno)
        return Image.network("http://openweathermap.org/img/wn/09d@2x.png",width:80,height:80,);
      else
        return Image.network("http://openweathermap.org/img/wn/09n@2x.png",width:80,height:80,);
    }
    //RAIN
    if(weatherDescription.contains("rain")){
      if(weatherDescription.contains("freezing")){
        if(giorno)

          return Image.network("http://openweathermap.org/img/wn/13d@2x.png",width:80,height:80,);
        else
          return Image.network("http://openweathermap.org/img/wn/13n@2x.png",width:80,height:80,);
      }
      if(weatherDescription.contains("shower")){
        if(giorno)
          return Image.network("http://openweathermap.org/img/wn/09d@2x.png",width:80,height:80,);
        else
          return Image.network("http://openweathermap.org/img/wn/09n@2x.png",width:80,height:80,);
      }
      if(giorno)
        return Image.network("http://openweathermap.org/img/wn/10d@2x.png",width:80,height:80,);
      else
        return Image.network("http://openweathermap.org/img/wn/10n@2x.png",width:80,height:80,);
}
    //SNOW
    if(weatherDescription.contains("snow")){
      if(giorno)
        return Image.network("http://openweathermap.org/img/wn/13d@2x.png",width:80,height:80,);
      else
        return Image.network("http://openweathermap.org/img/wn/13n@2x.png",width:80,height:80,);
    }
    //CLOUDS
    if(weatherDescription.contains("clouds")){
      if(weatherDescription.contains("few")){
        if(giorno)
          return Image.network("http://openweathermap.org/img/wn/02d@2x.png",width:80,height:80,);
        else
          return Image.network("http://openweathermap.org/img/wn/02n@2x.png",width:80,height:80,);
      }
      if(weatherDescription.contains("broken") || weatherDescription.contains("overcast")){
        if(giorno)
          return Image.network("http://openweathermap.org/img/wn/04d@2x.png",width:80,height:80,);
        else
          return Image.network("http://openweathermap.org/img/wn/04n@2x.png",width:80,height:80,);
      }
      //scattered
      if(giorno)
        return Image.network("http://openweathermap.org/img/wn/03d@2x.png",width:80,height:80,);
      else
        return Image.network("http://openweathermap.org/img/wn/03n@2x.png",width:80,height:80,);


    }
    if(giorno)
      return Image.network("http://openweathermap.org/img/wn/01d@2x.png",width:80,height:80,);
    
    return Image.network("http://openweathermap.org/img/wn/01n@2x.png",width:80,height:80,);

  }
  NetworkImage getImage2(String weatherDescription){
    bool giorno = true;
    DateTime _now = DateTime.now();

    if(_now.hour > 17)
      giorno = false;

    //THUNDERSTORM
    if(weatherDescription.contains("thunderstorm")){
      if(giorno) {
        return NetworkImage("http://openweathermap.org/img/wn/11d@2x.png");
      } else
        return NetworkImage("http://openweathermap.org/img/wn/11n@2x.png");
    }
    //DRIZZLE
    if(weatherDescription.contains("drizzle")){
      if(giorno)
        return NetworkImage("http://openweathermap.org/img/wn/09d@2x.png");
      else
        return NetworkImage("http://openweathermap.org/img/wn/09n@2x.png");
    }
    //RAIN
    if(weatherDescription.contains("rain")){
      if(weatherDescription.contains("freezing")){
        if(giorno)

          return NetworkImage("http://openweathermap.org/img/wn/13d@2x.png");
        else
          return NetworkImage("http://openweathermap.org/img/wn/13n@2x.png");
      }
      if(weatherDescription.contains("shower")){
        if(giorno)
          return NetworkImage("http://openweathermap.org/img/wn/09d@2x.png");
        else
          return NetworkImage("http://openweathermap.org/img/wn/09n@2x.png");
      }
      if(giorno)
        return NetworkImage("http://openweathermap.org/img/wn/10d@2x.png");
      else
        return NetworkImage("http://openweathermap.org/img/wn/10n@2x.png");
    }
    //SNOW
    if(weatherDescription.contains("snow")){
      if(giorno) {
        return NetworkImage("http://openweathermap.org/img/wn/13d@2x.png");
      } else
        return NetworkImage("http://openweathermap.org/img/wn/13n@2x.png");
    }
    //CLOUDS
    if(weatherDescription.contains("clouds")){
      if(weatherDescription.contains("few")){
        if(giorno)
          return NetworkImage("http://openweathermap.org/img/wn/02d@2x.png");
        else
          return NetworkImage("http://openweathermap.org/img/wn/02n@2x.png");
      }
      if(weatherDescription.contains("broken") || weatherDescription.contains("overcast")){
        if(giorno)
          return NetworkImage("http://openweathermap.org/img/wn/04d@2x.png");
        else
          return NetworkImage("http://openweathermap.org/img/wn/04n@2x.png");
      }
      //scattered
      if(giorno)
        return NetworkImage("http://openweathermap.org/img/wn/03d@2x.png");
      else
        return NetworkImage("http://openweathermap.org/img/wn/03n@2x.png");


    }
    if(giorno)
      return NetworkImage("http://openweathermap.org/img/wn/01d@2x.png");

    return NetworkImage("http://openweathermap.org/img/wn/01n@2x.png");

  }
  Widget contentFinishedDownload() {
    return Center(
      child: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) {

          return Container(
            margin: EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
              color:Color.fromRGBO(234,213, 230, 1),
            ),
            child: ListTile(
              leading: getImage(_data[index].weatherDescription as String),
              title: Text(_data[index].date.toString().substring(0,16)+"\n" + "Temperatura: " + _data[index].temperature.toString().substring(0,4) + "°C" + "\n Percepiti: " +_data[index].tempFeelsLike.toString().substring(0,4)+"°C" ),
              subtitle: Text("Minima: " + _data[index].tempMin.toString().substring(0,4) + "°C" + "\n Massima: " + _data[index].tempMax.toString().substring(0,4)+"°C"),
            ),
          );
        },
        separatorBuilder: (context, index) {
          print(_data[index].date!.hour);
          //BorghiMeteoPlus.aa è la data di oggi
          //Sto prevedendo che se il giorno che passa in questo momento è diverso allora dobbiamo mettere un separatore
               /* if (_data[index+1].date!.day != BorghiMeteoPlus.aa) {
                  BorghiMeteoPlus.aa = _data[index+1].date!.day;
                 return Center(child:Text("Giorno: "+
                   BorghiMeteoPlus.aa.toString(),
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                       color: Color.fromRGBO(160, 50, 41, 1)),
                 ));*/
          if(_data[index+1].date!.hour == 00){
            BorghiMeteoPlus.aa = _data[index+1].date!.day;
            return Center(child:Text("Giorno: "+
                BorghiMeteoPlus.aa.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(160, 50, 41, 1)),
            ));

                  print("Ciao");
                }



          print("Ciao2");
          return Divider(thickness: 0);
        },
      ),
    );
  }

  Widget contentNotDownloaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Errore nel caricamento delle previsioni',
          ),
        ],
      ),
    );
  }

  Widget _resultView() => _state == AppState.SCARICAMENTO_TERMINATO
      ? contentFinishedDownload()
      : _state == AppState.SCARICAMENTO
      ? contentDownloading()
      : contentNotDownloaded();

Widget contentFinishedDownload2(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
          padding: EdgeInsets.only(top:15,left:20,right:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Center(
                child: Text(widget.cityToFetchWeatherPrevision.toUpperCase(),
                    style: Theme.of(context).textTheme.caption!.copyWith(color: Color.fromRGBO(163, 52, 51, 1),fontSize:24,fontWeight:FontWeight.bold)),
              ),
              Center(child:Text((DateTime.now().day.toString() + "/" + DateTime.now().month.toString() + "/" + DateTime.now().year.toString()),style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black45,fontSize:16),),
              )],
          )
      ),
      Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        <Widget>[
          Container(
              padding: EdgeInsets.only(left:5),
              child: Column(
                  children:<Widget>[
                    SizedBox(height:10),
                    Text(
                      '${actualWeather.temperature.toString().substring(0,3)}\u2103',
                      style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black45,fontSize:25,fontWeight:FontWeight.bold),
                    ),
                    Text('Minima:${actualWeather.tempMin.toString()} ',style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black45,fontSize:14,fontWeight:FontWeight.bold),
                    ),
                    Text('Massima:${actualWeather.tempMax.toString()} ',style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black45,fontSize:14,fontWeight:FontWeight.bold)),


                  ]
              )
          ),
          Container(
              padding: EdgeInsets.only(right:20),
              child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Container(width:120,height:120,
                        decoration:BoxDecoration(

                            image: DecorationImage(
                                image: getImage2(actualWeather.weatherDescription as String),
                                fit: BoxFit.cover
                            )
                        )
                    ),
                  ]
              )
          )
        ],
      ),

    ],
  );
}
  Widget _resultView2() => _state == AppState.SCARICAMENTO_TERMINATO
      ? contentFinishedDownload2()
      : _state == AppState.SCARICAMENTO
      ? contentDownloading()
      : contentNotDownloaded();

  Future<bool> _wPc() async {
    print("Ho chiamato la funzione di back");
    returnBack();
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_wPc,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Card(
              color: Colors.white,
              elevation:5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: _resultView2()
            ),
            Text(
              'Giorni successivi:',
              style: TextStyle(fontSize: 20),
            ),
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            Expanded(child: _resultView())
          ],
        ),
      ),
    );
  }


}
