import 'dart:async';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app/screens/ItinerariGuida.dart';
import 'package:flutter_app/screens/NewsViewer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/borghi_list.dart';
import 'package:flutter_app/screens/borghimeteoplus.dart';
import 'package:flutter_app/screens/borgo_viewer.dart';
import 'package:flutter_app/screens/contactus_two.dart';
import 'package:flutter_app/screens/guidaviewer.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/contactus.dart';
import 'package:flutter_app/screens/culturaetradizione.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import 'globals.dart';
import 'models/borgo.dart';
import 'package:url_launcher/url_launcher.dart';
const String _urlPDF = "https://www.borghidarberia.it/itinerari/";

//ANDROID
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', //id
    'High Importance Notifications', //title
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOs = IOSInitializationSettings();
  var initSetttings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

  var cnf = await flutterLocalNotificationsPlugin.initialize(initSetttings,
      onSelectNotification: onSelectNotification);

  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  String? payload = notificationAppLaunchDetails!.payload;
  if (payload == "") {
    onSelectNotification(null);
  }

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Monserrat'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  var pop = false;


  Future _retrieveInfos() async {
    try {
      String url = 'https://www.borghidarberia.it/struct_api_V1.php';
      Map<String, String> headers = {
        "Content-type": "application/json",
        "charset": "utf-8"
      };
      Response response;
      try {
        response = await post(Uri.parse(url), headers: headers);
      } catch (_) {
        //Connessione non effettuata, aggiungere, quindi, chiusura applicazione
        return;
      }
      int statusCode = response.statusCode;

      if (statusCode == 403) {
        /*showDialog(
            context: context,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () {
                  return Future.value(false);
                },
                child: AlertDialog(
                  title: Text(AppLocalizations.of(context).unsupported),
                  content: new RichText(
                    text: new TextSpan(
                      children: [
                        new TextSpan(
                          text: AppLocalizations.of(context).updatept1,
                          style:
                              new TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        new TextSpan(
                          text: AppLocalizations.of(context).updatept2,
                          style:
                              new TextStyle(color: Colors.blue, fontSize: 21),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              launch('http://192.168.8.108:8000');
                            },
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Ok"),
                      onPressed: () {
                        if (Platform.isIOS) {
                          exit(0);
                        } else
                          SystemNavigator.pop();
                      },
                    ),
                  ],
                ),
              );
            });
        */
        return;
      }
      if (statusCode == 503) {
        /*showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context).providernotreach),
                content: new RichText(
                  text: new TextSpan(
                    children: [
                      new TextSpan(
                        text: AppLocalizations.of(context).providernotreachdes,
                        style: new TextStyle(color: Colors.black, fontSize: 21),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("Ok"),
                    onPressed: () {
                      isLoading = false;
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
        */
        return;
      }

      //Codec<String, String> stringToBase64 = utf8.fuse(base64);
      //String decoded = stringToBase64.decode();
      List<dynamic> body = jsonDecode(response.body);
      int i = 0;
      for (var a in body) {
        var tmpBorgo = Borgo.fromJson(a);
        borghiList[tmpBorgo.nome] = tmpBorgo;
      }
    } catch (Exception) {}
  }

  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessageFromSleep(initialMessage);
    }

    //Handle message with opened application
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Color.fromRGBO(163, 52, 51, 1),
                playSound: true,
                icon: '@drawable/prova_launch',
              ),
            ));
      }
    });

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessageFromSleep(RemoteMessage message) {
    openNewsNotification = true;
  }

  void _handleMessage(RemoteMessage message) {
    openNewsNotification = true;
    Navigator.of(navigatorKey.currentState!.context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 1000),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return MainScreen();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    setupInteractedMessage();

    Future.delayed(Duration(seconds: 4), () {
      _retrieveInfos().then((tst) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return MainScreen();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return Align(
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
          ),
        );
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(230, 230, 230, 1),
        body: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Column contents vertically,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Column contents horizontally,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Benvenuto!',
                    style: new TextStyle(
                        fontSize: 29.0,
                        color: Color.fromRGBO(163, 52, 51, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.all(12)),
                  Image(image: AssetImage('assets/images/prova_launch.PNG')),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                  ),
                  /*Text(
                    "Caricamento informazioni",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(163, 52, 51, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),*/
                  CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(163, 52, 51, 1)),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen();

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedDestination = 1;
  var myInitialLanguage = 'Italiano';
  List<String> languagesAvailable = ['Italiano', 'Inglese', 'Spagnolo', 'Albanese'];
  bool isDrawerBeingShown = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds:3000));
    isDrawerBeingShown = false;
    _showDrawer(context);
    print("Ora");

  }

  void _showDrawer(BuildContext context) async {
    if(!isDrawerBeingShown) {
      _scaffoldKey.currentState?.openDrawer();
      setState(() => isDrawerBeingShown = true);
      print("Drawer aperto");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/drawer_header.jpg'),
                fit: BoxFit.fill,
              ),

              //color: Color.fromRGBO(160, 50, 41, 1),
            ),
            child:
                null, /*CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://www.borghidarberia.it/wp-content/uploads/2021/02/logo-borgi-darberia-trasparente-300x300.png',
                ),
                maxRadius: 40,
              )*/
          ),
              ListTile(
                leading:Image(
                  image: AssetImage(
                      'assets/images/i_borghi.gif'),
                  width: 50,
                  height: 50,
                ), /*FaIcon(
              FontAwesomeIcons.city,
              color: Color.fromRGBO(163, 52, 51, 1),
            ),*/
                title: const Text("I borghi",style: TextStyle(
                  fontSize: 18,
                ),
                ),
                selected: _selectedDestination == 1,
                onTap: () => selectDestination(1, context, true),
              ),
              Divider(thickness:2,),
          ListTile(
            leading: Image(
    image: AssetImage(
    'assets/images/storia_arbereshe.gif'),
              width: 50,
              height: 50,
    ),
            /*FaIcon(
              FontAwesomeIcons.infoCircle,
              color: Color.fromRGBO(163, 52, 51, 1),
            ),*/
            title: const Text("Storia Arbëreshë",style: TextStyle(
              fontSize: 18,
            ),
            ),
            selected: _selectedDestination == 0,
            onTap: () => selectDestination(0, context, true),
          ),
              Divider(thickness: 2),
              ExpansionTile(
                leading:Image(
                    image: AssetImage(
                        'assets/images/guida_e_itinerari.gif')) ,
                title: Text('Guida e itinerari'),
                subtitle: Text('Tocca per espandere il menu'),
                controlAffinity: ListTileControlAffinity.leading,
                children: <Widget>[
                  ListTile(
                    leading: Image(
                      image: AssetImage(
                          'assets/images/guida_e_itinerari.gif'),
                      width: 50,
                      height: 50,
                    ),/*FaIcon(
                  FontAwesomeIcons.handPointRight,
                  color: Color.fromRGBO(163, 52, 51, 1),
                ),*/
                    title: const Text("Itinerari religiosi",style: TextStyle(
                      fontSize: 18,
                    ),
                    ),

                    onTap: () => selectDestination(8, context, true),
                  ),
                  ListTile(
                    leading: Image(
                      image: AssetImage(
                          'assets/images/guida_e_itinerari.gif'),
                      width: 50,
                      height: 50,
                    ),/*FaIcon(
                  FontAwesomeIcons.handPointRight,
                  color: Color.fromRGBO(163, 52, 51, 1),
                ),*/
                    title: const Text("Itinerari naturalistici",style: TextStyle(
                      fontSize: 18,
                    ),
                    ),

                    onTap: () => selectDestination(9, context, true),
                  ),
                  ListTile(
                    leading: Image(
                      image: AssetImage(
                          'assets/images/guida_e_itinerari.gif'),
                      width: 50,
                      height: 50,
                    ),/*FaIcon(
                  FontAwesomeIcons.handPointRight,
                  color: Color.fromRGBO(163, 52, 51, 1),
                ),*/
                    title: const Text("Itinerari culturali",style: TextStyle(
                      fontSize: 18,
                    ),
                    ),

                    onTap: () => selectDestination(10, context, true),
                  ),
                  ListTile(
                    leading: Image(
                      image: AssetImage(
                          'assets/images/guida_e_itinerari.gif'),
                      width: 50,
                      height: 50,
                    ),/*FaIcon(
                  FontAwesomeIcons.handPointRight,
                  color: Color.fromRGBO(163, 52, 51, 1),
                ),*/
                    title: const Text("Itinerari enogastronomici",style: TextStyle(
                      fontSize: 18,
                    ),
                    ),

                    onTap: () => selectDestination(11, context, true),
                  ),
                ],
              ),
              Divider(thickness: 2),
              ListTile(
                leading: Image(
                  image: AssetImage(
                      'assets/images/guida_e_itinerari.gif'),
                  width: 50,
                  height: 50,
                ),/*FaIcon(
                  FontAwesomeIcons.handPointRight,
                  color: Color.fromRGBO(163, 52, 51, 1),
                ),*/
                title: const Text("Guida e itinerari",style: TextStyle(
                  fontSize: 18,
                ),
                ),

                onTap: () {
                  _launchURL(_urlPDF);
                },
              ),


              Divider(thickness: 2),
          ListTile(
            leading:Image(
              image: AssetImage(
                  'assets/images/contact_us.gif'),
              width: 50,
              height: 50,
            ), /*FaIcon(
              FontAwesomeIcons.phone,
              color: Color.fromRGBO(163, 52, 51, 1),
            ),*/
            title: const Text("Contatti",style: TextStyle(
              fontSize: 18,
            ),
            ),
            selected: _selectedDestination == 4,
            onTap: () => selectDestination(4, context, true),
          ),
              Divider(thickness: 2),
              ListTile(
                leading: Image(
                  image: AssetImage(
                      'assets/images/cultura_e_tradizione.gif'),
                  width: 50,
                  height: 50,
                ),
                title: const Text("Cultura e Tradizione",style: TextStyle(
                  fontSize: 18,
                ),
                ),
                selected: _selectedDestination == 7,
                onTap: () => selectDestination(7, context, true),
              ),
              Divider(thickness: 2),
              ListTile(
                leading: Image(
                  image: AssetImage(
                      'assets/images/news.gif'),
                  width: 50,
                  height: 50,
                ),/*FaIcon(
                  FontAwesomeIcons.newspaper,
                  color: Color.fromRGBO(163, 52, 51, 1),
                ),*/
                title: const Text("News",style: TextStyle(
                  fontSize: 18,
                ),
                ),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(2, context, true),
              ),
          Divider(thickness: 0),
          Center(
              child: DropdownButton(
            onChanged: (value) {
              this.myInitialLanguage = value.toString();
              if (value.toString() == "Italiano") {
                selectedLanguage = "it-IT";
              } else if (value.toString() == "Inglese") {
                selectedLanguage = "en-US";
              } else if(value.toString() == "Albanese") {
                selectedLanguage="sq-SQ";
              }
              else {
                selectedLanguage = "es-ES";
              }

              (context as Element).markNeedsBuild();
            },
            value: myInitialLanguage,
            items: languagesAvailable
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/' + e.toLowerCase() + '.png'),
                              width: 50,
                              height: 50,
                            ),
                          ),
                          /*VerticalDivider(
                            thickness: 0,
                          ),*/
                          Padding(
                            padding: EdgeInsets.only(left:5),
                              child:Text(e))
                        ],
                      ),
                    ))
                .toList(),
          )),
        ])),
        appBar: AppBar(
          title: Text(
            "Borghi D'Arberia",

          ),
          leading: Builder(
            builder: (BuildContext context) {
              return InkWell(
                  onTap : (){
                    _scaffoldKey.currentState?.openDrawer();
                    print("Ciao");
                  },
                  child:Center(
                      child:Text("MENU",style: TextStyle(fontWeight: FontWeight.bold,decoration:TextDecoration.underline,color: Color.fromRGBO(160, 50, 41, 1)),)));
              /*return IconButton(
        icon: const Icon(
          Icons.book,
          color: Colors.red,
          size: 44, // Changing Drawer Icon Size
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );*/
            },
          ),
          bottom: () {
            if (_selectedDestination == 1) {
              return null;
            } else {
              return null;
            }
          }(),
          backgroundColor: Color.fromRGBO(162, 53, 55, 255),
          centerTitle: true,
          /*leading: InkWell(
            onTap: () => zoomDrawerController.toggle(),
            child: Icon(Icons.menu)),*/
        ),
        body: () {
          if (openNewsNotification) {
            openNewsNotification = false;
            return NewsViewer();
          }
          if (_selectedDestination == 0) {
            return StoriaScreen(
              selectScreen: selectDestination,
              parent: context,
            );
          }
          if (_selectedDestination == 1) {
            selectedBorgo = -1;
            return BorghiList();
          }
          if (_selectedDestination == 2) {
            return NewsViewer();
          }
          if (_selectedDestination == 3) {
            return GuidaViewer();
          }
          if (_selectedDestination == 4) {
            return ContactUs();
          }
          if (_selectedDestination == 5) {
            /*return BorghiMeteoPlus(
              cityToFetchWeatherPrevision: "Acquaformosa",
            );*/
          }
          if (_selectedDestination == 6) {
            return ContactUsNextPage();
          }
          if (_selectedDestination == 7) {
            return Itinerari();
          }
          if(_selectedDestination == 8){
          return ItinerariGuida(url:"https://www.borghidarberia.it/itinerari-religiosi/");
          }
          if(_selectedDestination == 9){
            return ItinerariGuida(url:"https://www.borghidarberia.it/itinerari-naturalistici/");
          }
          if(_selectedDestination == 10){
            return ItinerariGuida(url:"https://www.borghidarberia.it/itinerari-culturali/");
          }
          if(_selectedDestination == 11){
            return ItinerariGuida(url:"https://www.borghidarberia.it/itinerari-enogastronomici/");
          }
        }());
  }

  void selectDestination(int index, BuildContext ctx, bool fromMain) {
    _selectedDestination = index;
    if (fromMain) Navigator.pop(ctx);
    (ctx as Element).markNeedsBuild();
  }
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}

void onSelectNotification(String? payload) {
  openNewsNotification = true;
}
