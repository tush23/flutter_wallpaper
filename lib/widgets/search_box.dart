import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallpaper/views/search.dart';

Widget SearchBox(context){
  TextEditingController textEditingController = new TextEditingController();
  return Container(
          margin: EdgeInsets.only(left: 20,right: 20,top: 5),
          padding: EdgeInsets.only(left: 30,right: 30),
          decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(20)
          ),

          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  style: TextStyle(
                    fontFamily: "Product Sans"
                  ),
                  decoration: InputDecoration(
                      hintText: "Search Wallpaper",
                      hintStyle: TextStyle(
                        fontFamily: "Product Sans"
                    ),
                      border: InputBorder.none
                  ),
                ),
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>Search(searchQuery: textEditingController.text)
                    ));
                  },
                  child: Container(child: Icon(Icons.search))
              ),
            ],
          ),
        );
}