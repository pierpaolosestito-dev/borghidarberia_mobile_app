import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const double padding =20;
const double avatarRadius =45;
class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text_button;
  final String img;

  const CustomDialogBox({Key? key, required this.title,required this.descriptions, required this.text_button,required this.img}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: padding,top: avatarRadius
              +padding, right:padding,bottom:padding
          ),
          margin: EdgeInsets.only(top:avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromRGBO(234, 213, 230, 1),
              borderRadius: BorderRadius.circular(padding),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text(widget.descriptions,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),
                    color: Color.fromRGBO(160, 50, 41, 1),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text(widget.text_button,style: TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        ),
        Positioned(
          left: padding,
          right: padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: avatarRadius,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(avatarRadius)),
                child: Image.asset(widget.img),
            ),
          ),
        ),
      ],
    );
  }
}