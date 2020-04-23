import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterwallpaper/data/data.dart';
import 'package:flutterwallpaper/models/wallpaper_model.dart';
import 'package:flutterwallpaper/widgets/appbar_tile.dart';
import 'package:flutterwallpaper/widgets/wallpaper_tile.dart';
import 'package:http/http.dart'as http;

class Category extends StatefulWidget {

  final String categoryQuery;

  const Category({this.categoryQuery});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  String queryUrl ="https://api.pexels.com/v1/search?query=example+query&per_page=15&page=1";

  TextEditingController textEditingController = new TextEditingController();


  List<WallpaperModel> wallpaperModel = new List();
  bool _loading = true;

  getCategoryWalls(String queryString) async{

    var response = await http.get("https://api.pexels.com/v1/search?query=$queryString&per_page=100&page=1"
        ,headers:{
          "Authorization": apiKey
        });
    Map<String,dynamic> jsonDecodedResponse = jsonDecode(response.body);
    jsonDecodedResponse["photos"].forEach((element){
      //print(element);
      //getting map formatted data and we have to get in list format
      WallpaperModel wallModel = new WallpaperModel();
      wallModel = WallpaperModel.fromMap(element);
      wallpaperModel.add(wallModel);
      print(wallpaperModel);

    });

    setState(() {
      _loading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryWalls(widget.categoryQuery.toLowerCase());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppBarTileName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.red[100],
                    borderRadius: BorderRadius.circular(6),
                ),
                margin: EdgeInsets.only(top: 10,bottom: 5),
                padding: EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15),
                //color: Colors.red,
                child: Text(widget.categoryQuery,style: TextStyle(
                    fontFamily: 'Product Sans',
                    color: Colors.black,
                    letterSpacing: 1.2,
                    fontSize: 15
                  ),
                ),
              ),
              SizedBox(height: 10,),
              _loading ? Container(
                margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.all(10),

                child: CircularProgressIndicator(
                  //backgroundColor: Colors.red,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ):
              WallpaperTile(wallpapers: wallpaperModel,context: context)
            ],
          ),
        ),
      ),
    );
  }
}
