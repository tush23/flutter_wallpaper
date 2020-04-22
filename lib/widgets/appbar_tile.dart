import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AppBarTileName(){
  return RichText(
    text: TextSpan(
      text: "Wallpaper",
      style: TextStyle(
      fontFamily: 'Product Sans',
      fontSize: 20,
      color: Colors.black),
      children: <TextSpan>[
    TextSpan(
    text: "Select",
        style: TextStyle(
            fontFamily: 'Product Sans',
            //fontSize: 20,
            color: Colors.red),
        )
      ]
    ),
  );
}
