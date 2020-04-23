import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallpaper/models/wallpaper_model.dart';
import 'package:flutterwallpaper/views/image_view.dart';

Widget WallpaperTile({List<WallpaperModel> wallpapers,context}){
  return Container(
    margin: EdgeInsets.only(right: 10,left: 10),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 7,
      mainAxisSpacing: 7,
      childAspectRatio: 0.68,
      children: wallpapers.map((walls){
        return GridTile(
          child: GestureDetector(
            onTap:() {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ImageView(imgURL: walls.src.portrait,)
              ));
            },
            child: Hero(
              tag: walls.src.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: CachedNetworkImage(imageUrl: walls.src.portrait,fit: BoxFit.fill,),
                  ),
                ),
              ),
            ),
          ),
        );
    }).toList(),
    ),
  );
}