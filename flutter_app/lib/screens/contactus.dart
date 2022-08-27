import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
const String _urlFacebook = "https://www.facebook.com/borghidarberia";
const String _apiWhatsApp = "https://api.whatsapp.com/send/?phone=+393356304147&text=%22Ciao!%22";
const String _urlWebPage = "https://www.borghidarberia.it";
const String _makePhoneCall = "tel:+39-3356304147";
const String _mailToCall = "mailto:borghidarberia@gmail.com?subject=Informazioni per:";
class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 213, 230, 1),
      body: Center(
        child: Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              elevation: 15,
              shadowColor: Color.fromRGBO(160, 50, 41, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                //onTap: () => print("ciao"), //Non serve se si vuole rendere i child clickable
                child: FittedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Column(
                      children: [
                        
                        FadeInUp(child: Image(image: AssetImage('assets/images/contact_us.png'),fit: BoxFit.fill,)),
                        Divider(
                          thickness: 0,
                        ),
                        InkWell(
                          child: Center(
                            child: Text(
                              "www.borghidarberia.it",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                            onTap: () {
                              _launchURL(_urlWebPage);
                            } ,),
                        FadeInUp(
                          child: Container(

                              width: (MediaQuery.of(context).size.width) - 70,
                              margin: EdgeInsets.all(10),
                              child: Card(
                                  color: Colors.grey.shade300,
                                  elevation: 15,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                  child: Row(
                                    children: [
                                      Image(image: AssetImage('assets/images/facebook_icon.png'),height:(MediaQuery.of(context).size.height) /9, fit: BoxFit.cover,),
                                      VerticalDivider(),
                                      Expanded(
                                          child: ListTile(
                                        title: Text(
                                          "Facebook",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                            subtitle: Text(
                                                "Seguici su Facebook"),
                                            onTap: () {
                                              _launchURL(_urlFacebook);
                                            },
                                      )),
                                    ],
                                  ))),
                        ),
                       
                        FadeInUp(
                          child: Container(
                              //height: (MediaQuery.of(context).size.height) / 9,
                              width: (MediaQuery.of(context).size.width) - 70,
                              margin: EdgeInsets.all(10),
                              child: Card(
                                  color: Colors.grey.shade300,
                                  elevation: 15,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                  child: Row(
                                    children: [
                                      Image(image: AssetImage('assets/images/whatsapp_icon.png'),height:(MediaQuery.of(context).size.height) /9, fit: BoxFit.cover,),
                                      VerticalDivider(),
                                      Expanded(
                                          child: ListTile(
                                        title: Text(
                                          "WhatsApp",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                            subtitle: Text(
                                                "Scrivici su WhatsApp"),
                                            onTap: () {
                                              _launchURL(_apiWhatsApp);
                                            },
                                      )),
                                    ],
                                  ))),
                        ),
                        
                        FadeInUp(
                          child: Container(

                              width: (MediaQuery.of(context).size.width) - 70,
                              margin: EdgeInsets.all(10),
                              child: Card(
                                  color: Colors.grey.shade300,
                                  elevation: 15,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                  child: Row(
                                    children: [
                                      Image(image: AssetImage('assets/images/smartphone_icon.png'),height:(MediaQuery.of(context).size.height) /9, fit: BoxFit.cover,),
                                      VerticalDivider(),
                                      Expanded(
                                          child: ListTile(
                                        title: Text(
                                          "Telefono",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                            subtitle: Text(
                                                "Chiamaci al nostro recapito telefonico"),
                                        onTap: () {
                                              _launchURL(_makePhoneCall);
                                        },
                                      )),
                                    ],
                                  ))),
                        ),
                        
                        FadeInUp(
                          child: Container(

                              width: (MediaQuery.of(context).size.width) - 70,
                              margin: EdgeInsets.all(10),
                              child: Card(
                                  color: Colors.grey.shade300,
                                  elevation: 15,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                  child: Row(
                                    children: [
                                      Image(image: AssetImage('assets/images/email_icon.png'),height:(MediaQuery.of(context).size.height) /9, fit: BoxFit.cover,),
                                      VerticalDivider(),
                                      Expanded(
                                          child: ListTile(
                                        title: Text(
                                          "Email",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        subtitle: Text(
                                            "Inviaci un e-mail"),
                                            onTap: () {
                                              _launchURL(_mailToCall);
                                            },
                                      )),
                                    ],
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
/*Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: (MediaQuery.of(context).size.width) - 20,


    ),);*/