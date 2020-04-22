import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterwallpaper/data/data.dart';
import 'package:flutterwallpaper/models/wallpaper_model.dart';
import 'package:flutterwallpaper/widgets/appbar_tile.dart';
import 'package:flutterwallpaper/widgets/wallpaper_tile.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {

  final String searchQuery;

  const Search({this.searchQuery});


  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String queryUrl ="https://api.pexels.com/v1/search?query=example+query&per_page=100&page=1";

  TextEditingController textEditingController = new TextEditingController();


  List<WallpaperModel> wallpaperModel = new List();
  bool _loading = true;

  getSearchedWalls(String queryString) async{

    var response = await http.get("https://api.pexels.com/v1/search?query=$queryString&per_page=15&page=1"
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
    getSearchedWalls(widget.searchQuery);
    textEditingController.text = widget.searchQuery;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: AppBarTileName(),
        centerTitle: true,
        elevation: 0.0,
      ) ,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
          Container(
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

                  },
                  child: Container(child: Icon(Icons.search))
              ),
            ],
          ),
        ),
              SizedBox(height: 20,),
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
