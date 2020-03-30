import 'dart:io';
import 'package:flutter/cupertino.dart';

class InfoModel extends ChangeNotifier {
  File _image;
  String _plantType;
  String _owner;
  String _location;

  File get pathImage {
    assert(_image != null);
    return _image;
  }

  String get plantType {
    return _plantType;
  }

  String get getOwner {
    return _owner;
  }

  String get getLocation {
    return _location;
  }
}