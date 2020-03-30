import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(title: Text("Gallery Bar"),),
          SingleChildScrollView(
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text('Gallery Page'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
