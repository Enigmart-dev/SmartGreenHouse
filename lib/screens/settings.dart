import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(title: Text("Settings Bar"),),
          SingleChildScrollView(
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text('Settings Page'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
