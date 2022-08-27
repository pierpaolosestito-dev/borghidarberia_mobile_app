import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/borgo_viewer.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactUsNextPage extends StatefulWidget {
  const ContactUsNextPage({Key? key}) : super(key: key);

  @override
  _ContactUsNextPageState createState() => _ContactUsNextPageState();
}

class _ContactUsNextPageState extends State<ContactUsNextPage> {
  final GlobalKey webViewKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    /*InAppWebView(
                      key: webViewKey,
                      //In Case we want location
                      androidOnGeolocationPermissionsShowPrompt:
                          (InAppWebViewController controller,
                              String origin) async {
                        requestLocationPermission();
                        return GeolocationPermissionShowPromptResponse(
                            origin: origin, allow: true, retain: true);
                      },
                      initialUrlRequest: URLRequest(
                          url: Uri.parse(
                              "https://www.google.com/maps/place/87010+Acquaformosa+CS,+Italia/@39.723117,16.090315,16z/data=!4m5!3m4!1s0x133f13b92eec7e73:0x9c7fc98d982d2a35!8m2!3d39.7239373!4d16.0917063?hl=it")),
                    ),*/
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: (MediaQuery.of(context).size.height / 2),
              child: FadeInUp(
                child: InAppWebView(
                  key: webViewKey,
                  //In Case we want location
                  androidOnGeolocationPermissionsShowPrompt:
                      (InAppWebViewController controller, String origin) async {
                    requestLocationPermission();
                    return GeolocationPermissionShowPromptResponse(
                        origin: origin, allow: true, retain: true);
                  },
                  initialUrlRequest: URLRequest(
                      url: Uri.parse(
                          "https://www.google.it/maps/place/Borghi+d'Arberia/@39.4194327,16.1273342,17z/data=!3m1!4b1!4m5!3m4!1s0x133fa370355c9a71:0x375d0909e41d8cbc!8m2!3d39.4194327!4d16.1295229")),
                ),
              )),
          Divider(thickness: 3, color: Color.fromRGBO(163, 52, 51, 1)),
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: (MediaQuery.of(context).size.width / 2) - 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                                decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Nome e cognome: ',
                            )),
                            TextFormField(
                                decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Email mittente: ',
                            )),
                            TextFormField(
                                maxLines: 10,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Ciao Borghi D'Arberia!",
                                )),
                          ],
                        )),
                    VerticalDivider(
                      thickness: 3,
                    ),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FadeInUp(
                            child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/prova_launch.PNG"),
                          radius: 50,
                        )),
                        Divider(
                          thickness: 0,
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(160, 50, 41, 1),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            // Respond to button press
                          },
                          child: Text("INVIA EMAIL"),
                        ),
                      ],
                    )),
                  ])),
        ],
      ),
      /*Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child:
                        FadeInUp(
                            child:Image(image: AssetImage("assets/images/prova_launch.PNG")))),
    VerticalDivider(thickness: 3,),
    Container(
    width: (MediaQuery.of(context).size.width / 2) - 30,
    child: FadeInUp(child:InAppWebView(
      key: webViewKey,
      //In Case we want location
      androidOnGeolocationPermissionsShowPrompt:
              (InAppWebViewController controller,
              String origin) async {
            requestLocationPermission();
            return GeolocationPermissionShowPromptResponse(
                origin: origin, allow: true, retain: true);
      },
      initialUrlRequest: URLRequest(
              url: Uri.parse(
                  "https://www.google.it/maps/place/Borghi+d'Arberia/@39.4194327,16.1273342,17z/data=!3m1!4b1!4m5!3m4!1s0x133fa370355c9a71:0x375d0909e41d8cbc!8m2!3d39.4194327!4d16.1295229")),
    ),)),

              ]
      ),



            ),
          ],
        )*/
    );
  }

  Future<void> requestLocationPermission() async {
    final serviceStatus = await Permission.locationAlways.isGranted;

    bool isCameraOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.locationAlways.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }
}
