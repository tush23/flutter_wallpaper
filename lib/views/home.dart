import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterwallpaper/data/data.dart';
import 'package:flutterwallpaper/models/categries_model.dart';
import 'package:flutterwallpaper/models/wallpaper_model.dart';
import 'package:flutterwallpaper/widgets/appbar_tile.dart';
import 'package:flutterwallpaper/widgets/category_tile.dart';
import 'package:flutterwallpaper/widgets/search_box.dart';
import 'package:flutterwallpaper/widgets/wallpaper_tile.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoriesModel> categoryModel = new List();
  List<WallpaperModel> wallpaperModel = new List();
  bool _loading = true;

  String trendingUrl = "https://api.pexels.com/v1/curated?per_page=100&page=1";

  getTrendingWalls() async{
    
    var response = await http.get(trendingUrl,headers:{
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
    categoryModel = getCategories();
    getTrendingWalls();
    print(wallpaperModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: AppBarTileName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SearchBox(context),
              //SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(top: 15),
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categoryModel.length,
                    itemBuilder: (context,index){
                      return CategoryTile(
                        imageUrl: categoryModel[index].imgUrl,
                        categoryName: categoryModel[index].catNames,
                      );
                    }),
              ),
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
      )
    );
  }
}
