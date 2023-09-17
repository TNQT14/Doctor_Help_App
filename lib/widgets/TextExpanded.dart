import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../containts/containts.dart';

class TextExpanded extends StatefulWidget {
   TextExpanded({
    super.key,
    required this.text
  });

  String text;
  @override
  State<TextExpanded> createState() => _TextExpandedState();
}

class _TextExpandedState extends State<TextExpanded> {
  late String firstHaft;
  String secondHaft = '';
  bool flag = true;

  @override
  void initState() {
    super.initState();
    if(widget.text!=null||widget.text!=''){
      if(widget.text.length>150){
        firstHaft =widget.text.substring(0, 150);
        secondHaft=widget.text.substring(151, widget.text.length);
      }else{
        firstHaft=widget.text;
        secondHaft='';
      }
    }else{
      widget.text='';
      firstHaft=widget.text;
      secondHaft='';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHaft.length==''?
      Text(widget.text, textAlign: TextAlign.justify, style: txt16w4,) :
      RichText(text: TextSpan(
          text: flag?'$firstHaft ...':widget.text, style: txt16w4!.copyWith(color: Colors.black),
          children: [
            TextSpan(
                text: (widget.text.length>150)?( flag? ' Read More' : " Hide"): '',
                style: txt16w4!.copyWith(color: colorKmain),
                recognizer: TapGestureRecognizer()..onTap = (){
                  setState(() {
                    flag=!flag;
                  });
                }
            )
          ]
      )),
    );
  }
}