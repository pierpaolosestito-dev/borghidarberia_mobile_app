import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/models/borgo.dart';
import 'package:flutter_app/screens/borghi_list.dart';
import 'package:flutter_app/screens/borghimeteoplus.dart';
import 'package:flutter_app/widget/PlayGuideButton.dart';
import 'package:flutter_app/widget/popup_ui/CustomDialogBox.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:html_unescape/html_unescape.dart';



import '../globals.dart';

class BorgoViewer extends StatefulWidget {
  @override
  _BorgoViewer createState() => _BorgoViewer();

}

class _BorgoViewer extends State<BorgoViewer>

    with TickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  late TabController _tabController;
  int _currentPage = 0;
  var toDisplay = -1;
  var controllerPage = -1;
  final GlobalKey webViewKey = GlobalKey();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds:200),
    )..addListener(()=>controller.value = animation!.value);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    animationController.dispose();
    _tabController.dispose();
  }
  void rebuildRequested(int toUpdate) {
    if (controllerPage != -1) {
      if (toUpdate == -1) {
        controllerPage = -1;
        setState(() {});
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    var unescape = new HtmlUnescape();
    requestLocationPermission();
    if(controllerPage == 0){
      return BorghiMeteoPlus(cityToFetchWeatherPrevision: borghiList.values
          .toList()[selectedBorgo]
          .nome.split(" -")[0],rebuild: rebuildRequested,);
    }else{
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // give the tab bar a height [can change hheight to preferred height]
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: Color.fromRGBO(160, 50, 41, 1),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      child: Text(
                        'Utili',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                        child: Center(
                          child: Text(
                            'Storia e Itinerari',
                            style: TextStyle(
                              fontSize: 12.6,
                            ),
                          ),
                        )),
                    Tab(
                      child: Text(
                        'Mappa e Meteo',
                        style: TextStyle(fontSize: 12.6),
                      ),
                    ),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // first tab bar view widget
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            /*GestureDetector(
                              onDoubleTapDown: (details)=> tapDownDetails = details,
                              onDoubleTap: (){
                                final position = tapDownDetails!.localPosition;
                                final double scale = 3;
                                final x = -position.dx * (scale-1);
                                final y = -position.dy * (scale-1);
                                final zoomed = Matrix4.identity()
                                  ..translate(x,y)
                                  ..scale(scale);
                                final value = zoomed;
                                controller.value = value;
                              },
                              child: InteractiveViewer(
                                transformationController: controller,
                                clipBehavior: Clip.none,
                                panEnabled: false,
                                scaleEnabled: false,
                                child:*/ InteractiveViewer(
                              transformationController:  controller,
                              clipBehavior: Clip.none,
                                  minScale: 1,
                                  maxScale: 4,
                                  panEnabled: false,
                                  onInteractionEnd: (details){
                                      resetAnimation();
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: borghiList.values
                                        .toList()[selectedBorgo]
                                        .imgBorgo,
                                    imageBuilder: (context, imageProvider) => Container(
                                      margin: EdgeInsets.only(left: 5, right: 5),
                                      padding: EdgeInsets.all(5),
                                      height: 250.00,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Container(
                                      margin: EdgeInsets.only(left: 5, right: 5),
                                      padding: EdgeInsets.all(5),
                                      height: 250.00,
                                      child: LinearProgressIndicator(),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),



                                /*Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  padding: EdgeInsets.all(5),
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          borghiList.values
                                              .toList()[selectedBorgo]
                                              .imgBorgo,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.yellow.shade300,
                                      borderRadius: BorderRadius.circular(10)),
                                ),*/


                            /* Container(
                            width: double.infinity,
                            height: 180,
                            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.infoCircle),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Info",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FaIcon(FontAwesomeIcons.user),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          borghiList.values
                                              .toList()[selectedBorgo]
                                              .sindaco,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FaIcon(FontAwesomeIcons.users),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          borghiList.values
                                              .toList()[selectedBorgo]
                                              .numeroAbitanti,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FaIcon(FontAwesomeIcons.mountain),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          borghiList.values
                                              .toList()[selectedBorgo]
                                              .altezza,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),*/
                            /*Container(
                            width: double.infinity,
                            height: 180,
                            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.phone),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Numeri Utili",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FaIcon(FontAwesomeIcons.university),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          () {
                                            var splitted = borghiList.values
                                                .toList()[selectedBorgo]
                                                .numeriUtili
                                                .split(" ");

                                            return splitted[0] +
                                                " " +
                                                splitted[1];
                                          }(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FaIcon(FontAwesomeIcons.hospital),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          () {
                                            var splitted = borghiList.values
                                                .toList()[selectedBorgo]
                                                .numeriUtili
                                                .split(" ");

                                            return splitted[2] +
                                                " " +
                                                splitted[3];
                                          }(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 180,
                            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.hamburger),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Dove mangiare",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          borghiList.values
                                              .toList()[selectedBorgo]
                                              .doveMangiare,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 180,
                            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.bed),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Dove Dormire",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          borghiList.values
                                              .toList()[selectedBorgo]
                                              .doveDormire,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          */
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => {
                                      // show the dialog
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CustomDialogBox(
                                              title: "Numeri utili",
                                              descriptions:
                                              borghiList.values
                                                  .toList()[selectedBorgo]
                                                  .numeriUtili,
                                              text_button: "Chiudi",
                                              img:
                                              "assets/images/numeri_utili.jpg");
                                          /* return AlertDialog(
                                          title: Text("My title"),
                                          content: Column(
                                            children: [],
                                          ),
                                          actions: [
                                            TextButton(
                                              child: Text("OK"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );*/
                                        },
                                      ),
                                    },
                                    child: Container(
                                      height: 120,
                                      width: 80,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(230, 230, 230, 1),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: FadeInUp(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(FontAwesomeIcons.phone),
                                              Text(
                                                "Numeri Utili",
                                                textAlign: TextAlign.center,
                                                //style: TextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 120,
                                    width: 80,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(230, 230, 230, 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: GestureDetector(
                                        onTap: () => {
                                          // show the dialog
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CustomDialogBox(
                                                  title: "Dove mangiare",
                                                  descriptions:
                                                  borghiList.values
                                                      .toList()[selectedBorgo]
                                                      .doveMangiare,
                                                  text_button: "Chiudi",
                                                  img:
                                                  "assets/images/dove_mangiare.jpg");
                                              /* return AlertDialog(
                                          title: Text("My title"),
                                          content: Column(
                                            children: [],
                                          ),
                                          actions: [
                                            TextButton(
                                              child: Text("OK"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );*/
                                            },
                                          ),
                                        },
                                        child: FadeInUp(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(FontAwesomeIcons.hamburger),
                                              Text(
                                                "Dove Mangiare",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 120,
                                    width: 80,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(230, 230, 230, 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: GestureDetector(
                                        onTap: () => {
                                          // show the dialog
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CustomDialogBox(
                                                  title: "Dove dormire:",
                                                  descriptions:
                                                  borghiList.values
                                                      .toList()[selectedBorgo]
                                                      .doveDormire,
                                                  text_button: "Chiudi",
                                                  img:
                                                  "assets/images/dove_dormire.jpg");
                                              /* return AlertDialog(
                                          title: Text("My title"),
                                          content: Column(
                                            children: [],
                                          ),
                                          actions: [
                                            TextButton(
                                              child: Text("OK"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );*/
                                            },
                                          ),
                                        },
                                        child: FadeInUp(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(FontAwesomeIcons.bed),
                                              Text(
                                                "Dove Dormire",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                              /*Container(

                                width: double.infinity,
                                margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FaIcon(FontAwesomeIcons.city),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              borghiList.values
                                                  .toList()[selectedBorgo]
                                                  .nome ,
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
                                              ,color: Color.fromRGBO(163, 52, 51, 1)),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Divider(thickness:0),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              borghiList.values
                                                  .toList()[selectedBorgo]
                                                  .descrizione +
                                                  borghiList.values
                                                      .toList()[selectedBorgo]
                                                      .piccolaDescrizione,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 0,
                                          ),
                                          PlayGuideButton(
                                            textToPlay: borghiList.values
                                                .toList()[selectedBorgo]
                                                .descrizione +
                                                borghiList.values
                                                    .toList()[selectedBorgo]
                                                    .piccolaDescrizione,
                                            language: selectedLanguage,
                                          ),
                                          Divider(
                                            thickness: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/

                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 16,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                    child: Container(
                                      width: (MediaQuery.of(context).size.width) - 10,
                                      decoration: BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: Color.fromRGBO(160, 50, 41, 1),
                                                width: 10)),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[

                                                  Center(
                                                    child: Text(
                                                          borghiList.values
                                                              .toList()[selectedBorgo]
                                                              .nome.split(" -")[0].toUpperCase() ,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 20,
                                                          color:Color.fromRGBO(163, 52, 51, 1)),
                                                        ),
                                                  ),

                                                Divider(
                                                  thickness: 0,
                                                ),
                                                Text(
                                                    borghiList.values
                                                        .toList()[selectedBorgo]
                                                        .piccolaDescrizione + ":\n" +
                                                        borghiList.values
                                                            .toList()[selectedBorgo]
                                                            .descrizione,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    )),
                                                Divider(
                                                  thickness: 0,
                                                ),


                                                PlayGuideButton(
                                                  textToPlay: borghiList.values
                                                      .toList()[selectedBorgo]
                                                      .piccolaDescrizione +
                                                      borghiList.values
                                                          .toList()[selectedBorgo]
                                                          .descrizione,
                                                  language: selectedLanguage,
                                                ),
                                                Divider(
                                                  thickness: 0,
                                                ),
                                                /*
                          CardScrollWidget(currentPage),
                          Positioned.fill(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: images.length,
                              controller: controller,
                              reverse: true,

                              itemBuilder: (context, index) {
                                return Container(width: (MediaQuery.of(context).size.height) - 30);
                              },
                            ),
                          ),*/
                                              ])),
                                    ))

                          ],
                        ),
                      ),
                    ),

                    // second tab bar view widget
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GFCarousel(
                              activeIndicator: Colors.white,
                              pagerSize: MediaQuery.of(context).size.width / 18,
                              hasPagination: true,
                              enlargeMainPage: true,
                              enableInfiniteScroll: true,
                              height:250.00,
                              viewportFraction: 1.00,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                  //_currentKeyword = keywords[_currentPage];
                                });
                              },
                              items: borghiList.values
                                  .toList()[selectedBorgo]
                                  .cardsBorgo
                                  .map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return CachedNetworkImage(
                                      imageUrl: i.linkIMG,
                                      imageBuilder: (context, imageProvider) => Container(
                                        width: MediaQuery.of(context).size.width,

                                        margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        /*child:Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(top:200,bottom:20),
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(163, 52, 51, 1),
                                                  borderRadius: BorderRadius.circular(10),

                                                ),
                                                child: Text("  " + unescape.convert(borghiList.values.toList()[selectedBorgo].cardsBorgo[_currentPage].titolo)+"  ",
                                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)
                                                  ,),
                                              )
                                          ),
                                        )*/
                                      ),
                                      placeholder: (context, url) => Container(
                                        margin: EdgeInsets.only(left: 5, right: 5),
                                        padding: EdgeInsets.all(5),

                                        child: LinearProgressIndicator(),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),

                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            /*CarouselSlider(


                              options: CarouselOptions(
                                pageSnapping: true,
                                enlargeCenterPage: true,
                                aspectRatio: 16 / 9,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentPage = index;
                                    //_currentKeyword = keywords[_currentPage];
                                  });
                                },
                                height: 250.0,

                                enableInfiniteScroll: true,
                              ),
                              items: borghiList.values
                                  .toList()[selectedBorgo]
                                  .cardsBorgo
                                  .map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return CachedNetworkImage(
                                      imageUrl: i.linkIMG,
                                      imageBuilder: (context, imageProvider) => Container(
                                          width: MediaQuery.of(context).size.width,

                                          margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Container(
                                        margin: EdgeInsets.only(left: 5, right: 5),
                                        padding: EdgeInsets.all(5),

                                        child: LinearProgressIndicator(),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),

                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    )/*Container(
                                      width: MediaQuery.of(context).size.width,

                                      margin:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: new BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(i.linkIMG),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Stack(
                                        children: [
                                          /*Center(
                                            child: CustomPaint(
                                              size: Size(400, 400),
                                              painter: CurvedPainter(),
                                            ),
                                          ),*/
                                          /*Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 223),
                                              child: Text(
                                                i.titolo,
                                                style: TextStyle(
                                                    fontSize: 18.7,
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),*/
                                        ],
                                      ),
                                    )*/;
                                  },
                                );
                              }).toList(),
                            ),*/
                            SizedBox(height:25),
                            Stack(
                              children: [

                                Padding(
                                  padding:
                                  EdgeInsets.only(top: 0, left: 5, right: 5),
                                  child: Container(

                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(160, 50, 41, 1),
                                      border: Border.all(
                                        color: Color.fromRGBO(160, 50, 41, 1),
                                        width: 8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        20
                                      ),
                                    ),
                                    child:Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children:[
                                        SizedBox(height:35),
                                     Text(unescape.convert(borghiList.values.toList()[selectedBorgo].cardsBorgo[_currentPage].titolo) + "\n " +
                                      unescape.convert(borghiList.values
                                          .toList()[selectedBorgo]
                                          .cardsBorgo[_currentPage]
                                          .descrizione ),
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                        SizedBox(height:75),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 0,
                            ),
                            Center(
                              child: Text(
                                "Trascina col dito orizzontalmente sulle immagini per scoprire altri itinerari!",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                            Divider(
                              thickness: 0,
                            ),
                            PlayGuideButton(
                              textToPlay: unescape.convert(borghiList.values
                                  .toList()[selectedBorgo]
                                  .cardsBorgo[_currentPage]
                                  .titolo) + "\n" + unescape.convert(borghiList.values
                                  .toList()[selectedBorgo]
                                  .cardsBorgo[_currentPage]
                                  .descrizione),
                              language: selectedLanguage,
                            ),
                            Divider(
                              thickness: 0,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // third tab bar view widget

                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children:[
                          /*IconButton(
                            icon: Image.asset('assets/images/weather_icon.png'),
                            iconSize: 50,

                            onPressed: () {},
                          ),*/
                          SizedBox.fromSize(
                            size: Size(150, 150), // button width and height
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.green, // splash color
                                  onTap: () {
                                    controllerPage = 0;
                                    setState(() {});
                                  }, // button pressed
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      Image(image: AssetImage('assets/images/weather_icon.png'),height: 100,width:100), // icon
                                      Text("METEO",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:20,
                                        color: Color.fromRGBO(163, 52, 51, 1),
                                      ),), // text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text("Clicca sull'icona per le previsioni meteo del borgo",style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize:15,
                            color: Color.fromRGBO(163, 52, 51, 1),
                          ),),
                          Divider(thickness:2,),
                          Text("Scorri in fondo e accetta i cookie di Google per visualizzare la mappa",style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize:15,
                            color: Color.fromRGBO(163, 52, 51, 1),
                          ),),

                          SizedBox(height:25),
                          Expanded(child:Container(
                            child: InAppWebView(
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
                                  url: Uri.parse(borghiList.values
                                      .toList()[selectedBorgo]
                                      .linkGoogleMaps)),
                            ),

                          )),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

  }
  void resetAnimation(){
    animation = Matrix4Tween(
      begin: controller.value,
      end:Matrix4.identity(),
    ).animate(
      CurvedAnimation(parent:animationController,curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,)
    );
    animationController.forward(from:0);
  }
  //Request Location
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

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromRGBO(160, 50, 41, 1)
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.0, size.height * 0.85,
        size.width * 0.5, size.height * 0.85);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
