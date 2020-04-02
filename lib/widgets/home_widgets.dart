import 'package:flutter/material.dart';

class InfoLocation extends StatelessWidget {
  const InfoLocation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: <Widget>[
          Text(
            "ITI G. FERRARIS",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            "Scampia (NA)",
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