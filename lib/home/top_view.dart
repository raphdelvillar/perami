import 'package:flutter/material.dart';

class TopView extends StatefulWidget {
  @override
  _TopViewState createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {

  @override
  void initState() {
    super.initState();
  }

  String stateOfDay () {
    DateTime dt = new DateTime.now();
    int hour = dt.hour;

    if (hour >= 1 && hour <= 12) {
      return "Morning";
    } else if (hour >= 12 && hour <= 16) {
      return "Aftenoon";
    } else if (hour >= 16 && hour <= 24) {
      return "Evening";
    }
  }

  String greeting () {
    switch(stateOfDay()) {
      case "Morning":
        return "Good Morning!";
      case "Afternoon":
        return "Good Afternoon!";
      default:
        return "Good Evening!";
    }
  }

  List<Color> colortheme () {
    switch(stateOfDay()) {
      case "Morning":
        return [
          Colors.green[400],
          Colors.green[600],
          Colors.green[700],
          Colors.green[800]
        ];
      case "Afternoon":
        return [
          Colors.green[400],
          Colors.green[600],
          Colors.green[700],
          Colors.green[800]
        ];
      default:
        return [
          Colors.green[400],
          Colors.green[600],
          Colors.green[700],
          Colors.green[800]
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: colortheme()
          )
        ),
        height: 250,
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Center(
                child: Text(greeting(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white))),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: profilePic),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Center(
                  child: Text("Rolando Del Villar",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.white))))
        ]));
  }
}

Widget profilePic = Container(
    width: 75,
    height: 75,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image:
            DecorationImage(image: AssetImage("assets/img-placeholder.png"))));
