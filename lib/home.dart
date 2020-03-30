import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greenhouse/screens/gallery.dart';
import 'package:greenhouse/screens/greenhouses.dart';
import 'package:greenhouse/screens/settings.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _page = 1;
  final List<Widget> _children = [
    GalleryPage(),
    GreenHousesView(),
    SettingsPage(),
  ];
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        backgroundColor: Colors.white,
        color: Colors.green[300],
        animationDuration: Duration(milliseconds: 200),
        height: 55,
        items: <Widget>[
          Icon(Icons.photo, size: 30, color: Colors.black),
          Icon(Icons.home, size: 30, color: Colors.black),
          Icon(Icons.settings, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          child: _children[_page],
        ),
    );
  }
}