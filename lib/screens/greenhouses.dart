import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GreenHouseAppBar extends StatelessWidget {
  final urlIconApp = "test/icons/clover.png";

  const GreenHouseAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.green[300],
      leading: GestureDetector(
          child: Tab(
            icon: Image.asset(
              urlIconApp,
              height: 40,
              width: 40,
            ),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Smart GreenHouse APP", textAlign: TextAlign.center),
                    content: Text("Developed by Luigi Cuomo", textAlign: TextAlign.center),
                  );
                });
          }),
      title: Text(
        "Smart GreenHouses",
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: (){},
          iconSize: 30,
        ),
      ],
    );
  }
}


class GreenHousesView extends StatefulWidget {
  @override
  _GreenHousesViewState createState() => _GreenHousesViewState();
}

class _GreenHousesViewState extends State<GreenHousesView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        //margin: EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0),
        child: Column(
          children: <Widget>[
            GreenHouseAppBar(),
            Flexible(
              child: ListView(
                children: <Widget>[
                  GreenHouseCard(
                    pathImage: "test/images/immagine-serra.jpeg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogInfoGreenHouse extends StatefulWidget {
  final String pathImage;
  DialogInfoGreenHouse({Key key, this.pathImage}) : super(key : key);

  @override
  State<StatefulWidget> createState() => DialogInfoGreenHouseState();
}

class DialogInfoGreenHouseState extends State<DialogInfoGreenHouse>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text("Well hello there!"),
            ),
          ),
        ),
      ),
    );
  }
}

class GreenHouseCard extends StatefulWidget {
  GreenHouseCard({Key key, this.pathImage}) : super(key: key);

  final String pathImage;
  final pathIconsMeasurements = {
    'Temperature': "test/icons/temperature.png",
    'Humidity': "test/icons/humidity.png",
    'Water Level': "test/icons/water-level.png",
    'Brightness': "test/icons/brightness.png",
  };

  @override
  State<StatefulWidget> createState() => _GreenHouseCardState();
}

class _GreenHouseCardState extends State<GreenHouseCard>{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 400,
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: Card(
            child: Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GreenHouseImage(pathImage: this.widget.pathImage),
                  SizedBox(height: 10),
                  InfoLocation(),
                  SizedBox(height: 5),
                  Divider(thickness: 0.5, color: Colors.grey),
                  // TO BE REFACTORED !!!
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Tab(
                          icon: Image.asset(
                            widget.pathIconsMeasurements['Temperature'],
                            height: 40,
                            width: 40,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          ": 10",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Tab(
                          icon: Image.asset(
                            widget.pathIconsMeasurements['Brightness'],
                            height: 40,
                            width: 40,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          ": 10",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Tab(
                          icon: Image.asset(
                            widget.pathIconsMeasurements['Humidity'],
                            height: 40,
                            width: 40,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          ": 10",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Tab(
                          icon: Image.asset(
                            widget.pathIconsMeasurements['Water Level'],
                            height: 40,
                            width: 40,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          ": 10",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            elevation: 10.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => DialogInfoGreenHouse(),
        );
      },
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
      child: Image.asset(
        pathImage,
        fit: BoxFit.cover
      ),
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
