import 'package:flutter/material.dart';

class Loans extends StatefulWidget {
  @override
  _LoansState createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return makeCard;
      }
    );
  }
}

final makeCard = Card(
  elevation: 0,
  margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
  child: Container(
    decoration: BoxDecoration(color: Colors.white),
    child: makeListTile,
  )
);

final makeListTile = ListTile(
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  title: Text(
    "Introduction to Driving",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  subtitle: Row(
    children: [
      Text(" Intermediate", style: TextStyle(color: Colors.black))
    ],
  ),
);