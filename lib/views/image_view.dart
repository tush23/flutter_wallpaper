import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:http/http.dart' as http;

class ImageView extends StatefulWidget {

  final String imgURL;
  ImageView({this.imgURL});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  //for save and permission
  var filePath;
  String BASE64_IMAGE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgURL,
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: CachedNetworkImage(
                imageUrl: widget.imgURL, fit: BoxFit.cover,),
            ),
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //_imageSaver();
                    _save();
                    //Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(
                        top: 8, bottom: 8, right: 15, left: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              Colors.black54,
                              Colors.black54
                            ]
                        )
                    ),
                    child: Column(
                      children: <Widget>[
                        Text("Set Wallaper", style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Colors.white,
                            letterSpacing: 0.8,
                            fontSize: 13),),
                        Text("Image will be saved in gallery", style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 9,
                            color: Colors.white70,
                            letterSpacing: 0.8),)

                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white10, width: 1),
                        borderRadius: BorderRadius.circular(14),
                        gradient: LinearGradient(
                            colors: [
                              Colors.black12,
                              Colors.black12
                            ]
                        )
                    ),
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    padding: EdgeInsets.only(
                        top: 5, bottom: 5, left: 15, right: 15),
                    //color: Colors.red,
                    child: Text("Cancel", style: TextStyle(
                        fontFamily: 'Product Sans',
                        color: Colors.white70,
                        letterSpacing: 0.8,
                        fontSize: 10
                    ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _imageSaver() async{

    print("URL=="+widget.imgURL);
    print("----Image Saving----");
    var response = await http.get(widget.imgURL);
    filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
    _setWallpaper();
    print("-----Image Saved----");
    Navigator.pop(context);

  }
  static const platform = const MethodChannel("wallpaper");
  Future<void> _setWallpaper() async{
    try{
      final int result = await platform.invokeMethod('getWallpaper',{
        "test":filePath
      });
    }on PlatformException catch (e){
      print(e);
    }
  }





  _save() async {
    await _askPermission();
    print(widget.imgURL);
    var response = await Dio().get(
        widget.imgURL, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data));
    print("Result=="+result);
    Fluttertoast.showToast(
        msg: "Image Saved",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.pop(context);
  }
  _savePart2() async{
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(widget.imgURL);
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
      print(fileName+"=="+path);
    } on Exception catch (error) {
      print(error);
    }
  }



  _askPermission() async {

    PermissionStatus permissionStatus = await Permission.storage.request();
    return permissionStatus;
  }
}
