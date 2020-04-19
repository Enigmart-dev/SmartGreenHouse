import 'package:flutter/material.dart';

class InfoLocation extends StatelessWidget {
  const InfoLocation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Text(
            "Owner",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            "Location",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class GreenHouseImage extends StatelessWidget {
  const GreenHouseImage({Key key, this.pathImage}) : super(key: key);
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Image.asset(pathImage, fit: BoxFit.cover),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border(
            top: BorderSide(width: 1, color: Colors.black),
            left: BorderSide(width: 1, color: Colors.black),
            right: BorderSide(width: 1, color: Colors.black),
            bottom: BorderSide(width: 1, color: Colors.black),
          )),
    );
  }
}