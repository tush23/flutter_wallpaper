import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallpaper/models/wallpaper_model.dart';

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              child: CachedNetworkImage(imageUrl: walls.src.portrait,fit: BoxFit.fill,),
            ),
          ),
        );
    }).toList(),
    ),
  );
}