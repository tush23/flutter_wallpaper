import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Wallpaper',style:
              TextStyle(
                fontFamily: 'Product Sans',
                //fontSize: 20,
                color: Colors.black
              ),
            ),
            Text('Select',style:
            TextStyle(
                fontFamily: 'Product Sans',
                //fontSize: 20,
                color: Colors.red
            ),
            ),
          ],
        ),
        elevation: 0.1,
      ),
    );
  }
}
