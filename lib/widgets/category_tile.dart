import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallpaper/views/category.dart';

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;

  CategoryTile({this.imageUrl,this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       /* Navigator.push(context, MaterialPageRoute(
            builder: (context)=>CategoryNews(category: categoryName.toString().toLowerCase(),)),
        );*/
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>Category(categoryQuery: categoryName,)
            ));
          },
          child: Stack(
            children: <Widget>[
              ClipRRect
                (borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(imageUrl:imageUrl,height: 50,width: 100,fit: BoxFit.cover,)),
              Container(
                alignment:Alignment.center,
                height: 50,width: 100,
                decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(6)),
                child: Text(categoryName,style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Product Sans'
                ),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}